package main

import (
	"database/sql"
	"encoding/json"
	"log"

	"fmt"
	"net/http"
	"strconv"
	"strings"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

type Client struct {
	Id_client        int    `json:"id_client"`
	Nom_client       string `json:"nom_client"`
	Prenom_client    string `json:"prenom_client"`
	Adresse_client   string `json:"adresse_client"`
	Telephone_client int    `json:"telephone_client"`
}
type reservation struct {
	Id_reservation int    `json:"id_reservation"`
	Date_arrivee   string `json:"date_arrivee"`
	Date_depart    string `json:"date_depart"`
	Type_tarif     string `json:"type_tarif"`
	Id_client      int    `json:"id_client"`
	Num_chambre    int    `json:"num_chambre"`
}

type categorie struct {
	Idcategorie    int     `json:"id_categorie"`
	Nom_categorie  string  `json:"nom_categorie"`
	Tarif_unitaire float64 `json:"tarif_unitaire"`
	Num_chambre    int     `json:"num_chambre"`
}

type etage struct {
	Id_etage int `json:"id_etage"`
}
type hotel struct {
	Nom_hotel             string `json:"nom_hotel"`
	Id_etage              int    `json:"id_etage"`
	Nb_etages             int    `json:"nb_etages"`
	Nb_chambres_par_etage int    `json:"nb_chambres_par_etage"`
}
type chambre struct {
	Num_chambre int            `json:"num_chambre"`
	Id_etage    int            `json:"id_etage"`
	Idcategorie int            `json:"id_categorie"`
	Nom_hotel   sql.NullString `json:"nom_hotel"`
}
type service struct {
	Id_service     int            `json:"id_service"`
	Nom_service    string         `json:"nom_service"`
	Tarif_unitaire float64        `json:"tarif_unitaire"`
	Id_reservation sql.NullInt64  `json:"id_reservation,omitempty"`
	Nom_hotel      sql.NullString `json:"nom_hotel,omitempty"`
}

func main() {
	// les données de notre serveur MySQL

	server := "localhost"
	port := 3306
	user := "mouhamed"
	password := "passer"
	database := "gestionhotel"

	// Créez une chaîne de connexion
	connString := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s", user, password, server, port, database)

	// Ouvrez une connexion
	db, err := sql.Open("mysql", connString)
	if err != nil {
		log.Fatal(err)
	}

	// Vérifiez que la connexion est bien établie
	err = db.Ping()
	if err != nil {
		log.Fatal(err)
	}

	// Fermez la connexion à la fin du programme
	defer db.Close()

	// Afficher le message de succès
	fmt.Println("Connexion réussie à la base de données")
	// Créez un gestionnaire de requêtes HTTP
	http.HandleFunc("/clients", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == "GET" {
			// Récupérez tous les clients de la base de données
			rows, err := db.Query("SELECT Id_client, nom_client, Prenom_client, Adresse_client, Telephone_client FROM client")
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			defer rows.Close()

			// Parcourez les résultats de la requête et créez une liste de clients
			clients := []Client{}
			for rows.Next() {
				var client Client
				err := rows.Scan(&client.Id_client, &client.Nom_client, &client.Prenom_client, &client.Adresse_client, &client.Telephone_client)
				if err != nil {
					http.Error(w, err.Error(), http.StatusInternalServerError)
					return
				}
				clients = append(clients, client)
			}
			if err := rows.Err(); err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Créez une réponse JSON avec la liste des clients
			json.NewEncoder(w).Encode(clients)
		} else if r.Method == "POST" {
			// Récupérez le corps de la requête JSON
			var newClient Client
			err := json.NewDecoder(r.Body).Decode(&newClient)
			if err != nil {
				http.Error(w, err.Error(), http.StatusBadRequest)
				return
			}

			// Insérez le nouveau client dans la base de données
			result, err := db.Exec("INSERT INTO client (nom_client, prenom_client, adresse_client, telephone_client) VALUES (?, ?, ?, ?)", newClient.Nom_client, newClient.Prenom_client, newClient.Adresse_client, newClient.Telephone_client)
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Récupérez l'ID du nouveau client inséré
			newID, err := result.LastInsertId()
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Renvoyez une réponse JSON avec l'ID du nouveau client
			response := map[string]int64{"id_client": newID}
			json.NewEncoder(w).Encode(response)
		} else if r.Method == "PUT" {
			// Récupérez l'ID du client à mettre à jour à partir de la requête URL
			clientID := r.URL.Path[len("/clients/"):]

			// Récupérez le corps de la requête JSON
			var updatedClient Client
			err := json.NewDecoder(r.Body).Decode(&updatedClient)
			if err != nil {
				http.Error(w, err.Error(), http.StatusBadRequest)
				return
			}

			// Mettez à jour le client dans la base de données
			result, err := db.Exec("UPDATE client SET nom_client = ?, prenom_client = ?, adresse_client = ?, telephone_client = ? WHERE id_client = ?", updatedClient.Nom_client, updatedClient.Prenom_client, updatedClient.Adresse_client, updatedClient.Telephone_client, clientID)
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Renvoyez une réponse JSON avec le nombre de lignes modifiées
			rowsAffected, err := result.RowsAffected()
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			response := map[string]int64{"rows_affected": rowsAffected}
			json.NewEncoder(w).Encode(response)
		} else if r.Method == "DELETE" {
			// Récupérez l'ID du client à supprimer à partir de la requête URL
			clientID := r.URL.Path[len("/clients/"):]

			// Supprimez le client dans la base de données
			result, err := db.Exec("DELETE FROM client WHERE id_client = ?", clientID)
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Renvoyez une réponse JSON avec le nombre de lignes supprimées
			rowsAffected, err := result.RowsAffected()
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			response := map[string]int64{"rows_affected": rowsAffected}
			json.NewEncoder(w).Encode(response)
		}
	})
	// Méthode GET pour récupérer toutes les réservations
	http.HandleFunc("/reservations", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == "GET" {
			// Récupérez toutes les réservations de la base de données
			rows, err := db.Query("SELECT Id_reservation, Date_arrivee, Date_depart, Type_tarif, Id_client, Num_chambre FROM reservation")
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			defer rows.Close()

			// Parcourez les résultats de la requête et créez une liste de réservations
			reservations := []reservation{}
			for rows.Next() {
				var reservation reservation
				err := rows.Scan(&reservation.Id_reservation, &reservation.Date_arrivee, &reservation.Date_depart, &reservation.Type_tarif, &reservation.Id_client, &reservation.Num_chambre)
				if err != nil {
					http.Error(w, err.Error(), http.StatusInternalServerError)
					return
				}
				reservations = append(reservations, reservation)
			}
			if err := rows.Err(); err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Créez une réponse JSON avec la liste des réservations
			json.NewEncoder(w).Encode(reservations)
		} else if r.Method == "POST" {
			// Analyser le corps de la requête JSON dans une struct réservation
			var res reservation
			err := json.NewDecoder(r.Body).Decode(&res)
			if err != nil {
				http.Error(w, err.Error(), http.StatusBadRequest)
				return
			}

			// Insérer la réservation dans la base de données
			stmt, err := db.Prepare("INSERT INTO reservation(Date_arrivee, Date_depart, Type_tarif, Id_client, Num_chambre, Telephone_client) VALUES (?, ?, ?, ?, ?, ?)")
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			defer stmt.Close()

			_, err = stmt.Exec(res.Date_arrivee, res.Date_depart, res.Type_tarif, res.Id_client, res.Num_chambre)
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Renvoyer la réservation ajoutée avec un code de statut HTTP 201 Created
			w.WriteHeader(http.StatusCreated)
			json.NewEncoder(w).Encode(res)
		} else if r.Method == "DELETE" {
			// Récupérer l'ID de la réservation dans l'URL
			idStr := strings.TrimPrefix(r.URL.Path, "/reservations/")
			id, err := strconv.Atoi(idStr)
			if err != nil {
				http.Error(w, "Invalid ID", http.StatusBadRequest)
				return
			}

			// Supprimer la réservation correspondante dans la base de données
			result, err := db.Exec("DELETE FROM reservation WHERE Id_reservation = ?", id)
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Vérifier si la suppression a affecté une ligne
			rowsAffected, err := result.RowsAffected()
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			if rowsAffected == 0 {
				http.Error(w, "Reservation not found", http.StatusNotFound)
				return
			}

			// Envoyer une réponse de succès
			w.WriteHeader(http.StatusNoContent)
		} else // Vérifiez que la méthode est PUT
		if r.Method == "PUT" {
			// Récupérez l'ID de la réservation à mettre à jour à partir de la requête URL
			vars := mux.Vars(r)
			reservationID, err := strconv.Atoi(vars["id_reservation"])
			if err != nil {
				http.Error(w, err.Error(), http.StatusBadRequest)
				return
			}

			// Récupérez le corps de la requête JSON
			var updatedReservation reservation
			err = json.NewDecoder(r.Body).Decode(&updatedReservation)
			if err != nil {
				http.Error(w, err.Error(), http.StatusBadRequest)
				return
			}

			// Mettez à jour la réservation dans la base de données
			result, err := db.Exec("UPDATE reservation SET date_arrivee = ?, date_depart = ?, type_tarif = ?, id_client = ?, num_chambre = ? WHERE id_reservation = ?", updatedReservation.Date_arrivee, updatedReservation.Date_depart, updatedReservation.Type_tarif, updatedReservation.Id_client, updatedReservation.Num_chambre, reservationID)
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Vérifiez que la réservation a bien été mise à jour
			rowsAffected, err := result.RowsAffected()
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			if rowsAffected == 0 {
				http.Error(w, "Réservation introuvable", http.StatusNotFound)
				return
			}

			// Renvoyez une réponse JSON avec l'ID de la réservation mise à jour
			response := map[string]int{"id_reservation": reservationID}
			json.NewEncoder(w).Encode(response)
		}
	})
	http.HandleFunc("/reservations/{id_reservation}", func(w http.ResponseWriter, r *http.Request) {
		// Récupérez l'identifiant de la réservation à partir des variables de chemin
		vars := mux.Vars(r)
		id, err := strconv.Atoi(vars["id_reservation"])
		if err != nil {
			http.Error(w, "Invalid reservation ID", http.StatusBadRequest)
			return
		}

		// Récupérez la réservation à partir de la base de données
		rows, err := db.Query("SELECT * FROM reservation WHERE ID_reservation = ?", id)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		defer rows.Close()

		// Vérifiez que la réservation a été trouvée
		if !rows.Next() {
			http.Error(w, "Reservation not found", http.StatusNotFound)
			return
		}

		// Parcourez les résultats de la requête et créez une instance de réservation
		var res reservation
		err = rows.Scan(&res.Id_reservation, &res.Date_arrivee, &res.Date_depart, &res.Type_tarif, &res.Id_client, &res.Num_chambre)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		// Renvoyer la réservation sous forme de réponse JSON
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(res)
	})
	http.HandleFunc("/chambres", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == "GET" {
			// Récupérez toutes les chambres de la base de données
			rows, err := db.Query("SELECT Num_chambre, Id_etage, Idcategorie, Nom_hotel FROM chambre")
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}
			defer rows.Close()

			// Parcourez les résultats de la requête et créez une liste de chambres
			chambres := []chambre{}
			for rows.Next() {
				var chambre chambre
				err := rows.Scan(&chambre.Num_chambre, &chambre.Id_etage, &chambre.Idcategorie, &chambre.Nom_hotel)
				if err != nil {
					http.Error(w, err.Error(), http.StatusInternalServerError)
					return
				}
				chambres = append(chambres, chambre)
			}
			if err := rows.Err(); err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Créez une réponse JSON avec la liste des chambres
			json.NewEncoder(w).Encode(chambres)
		} else if r.Method == "POST" {
			// Récupérez le corps de la requête JSON
			var newChambre chambre
			err := json.NewDecoder(r.Body).Decode(&newChambre)
			if err != nil {
				http.Error(w, err.Error(), http.StatusBadRequest)
				return
			}

			// Insérez la nouvelle chambre dans la base de données
			result, err := db.Exec("INSERT INTO chambre (num_chambre, id_etage, id_categorie, nom_chambre) VALUES (?, ?, ?, ?)", newChambre.Num_chambre, newChambre.Id_etage, newChambre.Idcategorie, newChambre.Nom_hotel)
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Récupérez l'ID de la nouvelle chambre insérée
			newID, err := result.LastInsertId()
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			// Renvoyez une réponse JSON avec l'ID de la nouvelle chambre
			response := map[string]int64{"num_chambre": newID}
			json.NewEncoder(w).Encode(response)
		} else {
			http.Error(w, "Méthode non autorisée", http.StatusMethodNotAllowed)
		}

	})

	// Lancez le serveur HTTP
	http.ListenAndServe(":8080", nil)
}

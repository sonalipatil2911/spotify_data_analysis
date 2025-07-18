# 🎵 Spotify Data Analysis

This project explores a comprehensive dataset from Spotify, focusing on audio features and user engagement metrics across various tracks. Using Python and data visualization tools, we uncover patterns in music preferences, track characteristics, and listener behavior.

---

## 📁 Dataset Overview

The dataset contains one table with the following columns:

- `track` – Name of the song
- `artist` – Performing artist
- `album` – Album the track belongs to
- `tempo` – Beats per minute
- `valence` – Musical positivity (0–1)
- `speechiness` – Presence of spoken words
- `liveness` – Likelihood of a live performance
- `likes` – Number of likes
- `comments` – Number of user comments
- `views` – View count
- `duration` – Length of the track (in Minutes)
- `energy` – Intensity and activity level (0–1)
- `danceability` – Suitability for dancing (0–1)

---

## 📊 Objectives

- Identify relationships between audio features and engagement metrics
- Visualize the distribution of tempo, energy, valence, and other features
- Highlight the characteristics of popular vs. underrated tracks

---

## ⚙️ Tools & Technologies

- **PostgreSQL**  

## 📌 Key Insights

- Danceable songs with high energy tend to attract more likes and views
- Tracks with lower speechiness often score higher in valence

*Explore the notebooks to view detailed analyses and visuals!*

---

## 📂 Folder Structure
├── data/   

    # spotify_dataset.csv

├── script/                   

  schema.sql
  
  analysis.sql

├── README.md  


---

## 🚀 Getting Started

1. Clone the repository  
   `git clone https://github.com/your-username/spotify-data-analysis.git`


## 📣 Contribute

Pull requests welcome! Feel free to enhance visualizations, add new insights, or suggest improvements.


## 📜 License

This project is open-source under the [MIT License](LICENSE).


## 🤝 Acknowledgements

- Spotify API (for data structure reference)
- Open source music datasets

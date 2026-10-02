# ⚽ FIFA World Cup 2026 — End-to-End Data Analytics Project

> **An end-to-end football analytics project covering data collection, data cleaning, integration, SQL analysis, Excel analysis, and an interactive Power BI dashboard.**

![Python](https://img.shields.io/badge/Python-3.x-3776AB?logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-150458?logo=pandas&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Database%20Analysis-4479A1?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=000000)
![Excel](https://img.shields.io/badge/Excel-Analysis-217346?logo=microsoftexcel&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebooks-F37626?logo=jupyter&logoColor=white)

## 📌 Project Overview

This project is a complete **FIFA World Cup 2026 data analytics pipeline** designed to transform raw football data into structured datasets, analytical outputs, and interactive business-style visualizations.

The project combines multiple data sources covering **teams, stadiums, matches, players, goals, match statistics, physical statistics, and player performance**. The collected data is cleaned, validated, normalized, integrated, and analyzed using Python, SQL, Excel, and Power BI.

The main objective is to demonstrate an end-to-end data workflow rather than performing analysis on a single dataset.

---

## 🎯 Objectives

- Collect football data from multiple sources.
- Build clean and structured datasets for analysis.
- Integrate player, team, match, goal, and physical-performance data.
- Resolve inconsistencies between data sources, including player and team names.
- Perform exploratory data analysis (EDA).
- Analyze team and player performance.
- Use SQL to answer football-related analytical questions.
- Create Excel-based analytical outputs.
- Build an interactive Power BI dashboard.
- Present the main findings in a professional presentation.

---

## 📊 Data Coverage

The project contains datasets covering:

- **48 teams** participating in the tournament.
- Teams and team information.
- Stadiums and venues.
- Matches and match results.
- Match statistics.
- Players and squad information.
- Player physical statistics.
- Goals and goal events.
- Consolidated player statistics.
- Player ID mapping used for data integration.

### Main datasets

| Dataset | Description |
|---|---|
| `Teams.csv` | Team information |
| `Stadiums.csv` | Stadium and venue information |
| `Matches.csv` | Match-level information and results |
| `MatchStatistics.csv` | Match statistics |
| `Players.csv` | Player and squad information |
| `PlayerPhysicalStats.csv` | Player physical measurements/statistics |
| `Goals.csv` | Goal events |
| `FIFA_WorldCup_2026_Master_Player_Stats.csv` | Integrated player statistics |
| `FIFA_WorldCup_2026_Match_Fact.csv` | Match-level analytical fact table |
| `FIFA_WorldCup_2026_Match_Team_Stats.csv` | Team-level match statistics |
| `FIFA_PlayerID_Mapping.csv` | Player ID mapping for integration |

---

## 🔄 Data Pipeline

```text
Multiple Data Sources
        │
        ▼
Data Collection
        │
        ▼
Data Cleaning & Validation
        │
        ▼
Name Normalization & ID Mapping
        │
        ▼
Data Integration
        │
        ├──────────────► Python / EDA
        │
        ├──────────────► SQL Analysis
        │
        ├──────────────► Excel Analysis
        │
        └──────────────► Power BI Dashboard
                              │
                              ▼
                         Final Insights
```

---

## 🐍 Python & Data Collection

The project uses a sequence of Jupyter Notebooks to collect and prepare the datasets:

| Notebook | Purpose |
|---|---|
| `01_Teams_Collection.ipynb` | Collect team data |
| `02_Stadiums_Collection.ipynb` | Collect stadium data |
| `03_Matches_Collection.ipynb` | Collect match data |
| `04_MatchStatistics_Collection.ipynb` | Collect match statistics |
| `05_Players_Collection.ipynb` | Collect player data |
| `06_PlayerPhysicalStats_Collection.ipynb` | Collect physical player statistics |
| `07_Goals_Collection.ipynb` | Collect goal data |
| `08_Player Statistics.ipynb` | Process, integrate, and analyze player statistics |

### Data preparation includes

- Missing-value handling.
- Duplicate and consistency checks.
- Data type correction.
- Player-name normalization.
- Team-name normalization.
- Player ID mapping.
- Merging data from different sources.
- Validation of integrated records.
- Creation of analysis-ready datasets.

---

## 🗄️ SQL Analysis

The project includes a SQL database structure with table creation and data insertion scripts, followed by analytical queries.

### Example questions answered with SQL

- Which teams scored the most goals?
- How many matches did each team play?
- How are goals distributed across tournament stages?
- What is the average number of goals per match by stage?
- Which teams achieved the most wins?
- Which teams conceded the most goals?
- Who are the top goal scorers?
- What is each team's win rate?
- How do goals scored compare with goals conceded?
- What is the overall match-performance summary for each team?

### SQL files

The `sql/` folder contains:

- Database and table creation scripts.
- Data insertion scripts.
- Data validation scripts.
- Ten analytical SQL queries.

---

## 📈 Excel Analysis

The `excel/` folder contains the Excel analysis workbook and supporting datasets.

**Main file:** `FIFA_WorldCup_2026_Analysis.xlsx`

The Excel analysis provides additional summaries and analytical views of:

- Goals.
- Matches.
- Players.
- Match statistics.
- Tournament-stage performance.

---

## 📊 Power BI Dashboard

The project includes an interactive Power BI dashboard:

`dashboard/fifa world cup.pbix`

The dashboard is supported by a custom **Deneb visual** and is designed to provide an interactive view of the tournament data and player/team performance.

### Dashboard focus

- Team performance.
- Player performance.
- Goals and scoring analysis.
- Match statistics.
- Tournament-stage analysis.
- Comparative football statistics.

---

## 🎤 Project Presentation

A presentation is included in the `presentation/` folder:

`FIFA_WorldCup_2026_Presentation.pptx`

It summarizes the project methodology, analytical process, and key outputs.

---

## 🗂️ Project Structure

```text
FIFA_WorldCup_2026_Project/
│
├── Data/
│   ├── Teams.csv
│   ├── Stadiums.csv
│   ├── Matches.csv
│   ├── MatchStatistics.csv
│   ├── Players.csv
│   ├── PlayerPhysicalStats.csv
│   ├── Goals.csv
│   ├── FIFA_PlayerID_Mapping.csv
│   ├── FIFA_WorldCup_2026_Master_Player_Stats.csv
│   ├── FIFA_WorldCup_2026_Match_Fact.csv
│   ├── FIFA_WorldCup_2026_Match_Team_Stats.csv
│   └── FIFA_WorldCup_2026_SquadLists.pdf
│
├── Notebooks/
│   ├── 01_Teams_Collection.ipynb
│   ├── 02_Stadiums_Collection.ipynb
│   ├── 03_Matches_Collection.ipynb
│   ├── 04_MatchStatistics_Collection.ipynb
│   ├── 05_Players_Collection.ipynb
│   ├── 06_PlayerPhysicalStats_Collection.ipynb
│   ├── 07_Goals_Collection.ipynb
│   └── 08_Player Statistics.ipynb
│
├── sql/
│   ├── tables creation.sql
│   ├── inserts values.sql
│   ├── 01_Top_Scoring_Teams.sql
│   ├── 02_Matches_Played_By_Team.sql
│   ├── ...
│   └── 10_Team_Match_Performance_Summary.sql
│
├── excel/
│   ├── FIFA_WorldCup_2026_Analysis.xlsx
│   └── supporting analysis files
│
├── dashboard/
│   ├── fifa world cup.pbix
│   └── deneb.standalone.2.0.0.0.pbiviz
│
└── presentation/
    └── FIFA_WorldCup_2026_Presentation.pptx
```

---

## 🛠️ Technologies & Skills

**Programming & Analysis**

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook

**Data Engineering / Collection**

- Web Scraping
- API Integration
- Data Cleaning
- Data Validation
- Data Transformation
- Data Integration
- Entity / Name Normalization

**Database & BI**

- SQL
- Microsoft Excel
- Power BI
- Deneb / Vega-Lite

**Workflow**

- Git / GitHub
- Structured ETL workflow
- Analytical reporting

---

## 🚀 How to Run the Python Analysis

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/FIFA_WorldCup_2026_Project.git
cd FIFA_WorldCup_2026_Project
```

### 2. Install dependencies

```bash
pip install pandas numpy matplotlib seaborn jupyter requests beautifulsoup4 selenium
```

> If a notebook requires an additional package, install it before running that notebook.

### 3. Start Jupyter Notebook

```bash
jupyter notebook
```

Open the notebooks inside the `Notebooks/` folder and run them in sequence.

---

## 📌 Recommended Workflow

For reproducing the project from the beginning:

1. Run the data-collection notebooks.
2. Review and validate the generated datasets.
3. Run the player-statistics integration notebook.
4. Load the prepared data into the SQL database.
5. Execute the SQL analysis scripts.
6. Open the Excel workbook for spreadsheet analysis.
7. Open the `.pbix` file in Power BI Desktop to explore the dashboard.
8. Review the final presentation for the project summary.

---

## 💡 What This Project Demonstrates

This project demonstrates practical experience with a complete analytics workflow:

**Raw Data → Collection → Cleaning → Validation → Integration → Analysis → Visualization → Reporting**

It also demonstrates the ability to work with multiple related datasets and combine different analytics tools into one end-to-end project.

---

## 📎 Project Deliverables

- 🐍 Python/Jupyter data-collection and analysis notebooks.
- 📁 Cleaned and integrated datasets.
- 🗄️ SQL database scripts and analytical queries.
- 📊 Power BI interactive dashboard.
- 📈 Excel analysis workbook.
- 🎤 Project presentation.

---

## 👨‍💻 Author

**Ahmed Elhossary**

Computer Science / Software Engineering

Interested in **Data Science, Machine Learning, AI Automation, and Data Analytics**.

---

## ⭐ If you find this project useful

Feel free to explore the notebooks, SQL analysis, dashboard, and datasets to understand the complete workflow from raw football data to final analytical insights.

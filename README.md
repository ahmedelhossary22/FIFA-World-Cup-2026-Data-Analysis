FIFA World Cup 2026 Data Analytics Project
A complete end-to-end data analytics project focused on the FIFA World Cup 2026, covering data collection, cleaning, validation, integration, SQL analysis, Excel analysis, and interactive Power BI visualization.
The project combines football data from multiple sources into structured datasets that can be used to analyze teams, players, matches, goals, stadiums, match statistics, and player performance.
Project Overview
The project was developed as a practical data analytics pipeline rather than a single analysis notebook. It includes:
- Automated data collection using Python and FIFA APIs.
- Data extraction and preprocessing with Pandas.
- Data validation and consistency checks.
- Integration of data from multiple sources.
- Player and team ID mapping and name normalization.
- SQL database design and analytical queries.
- Excel-based analysis.
- Interactive Power BI dashboard development.
- A presentation summarizing the project and findings.
Data Coverage
The repository contains datasets covering:
- 48 teams
- 16 stadiums
- 104 matches
- 1,248 players
- Player physical statistics
- Match statistics
- Goal events
- Team and player performance statistics
Data Pipeline
FIFA APIs / Data Sources
          ↓
   Data Collection
          ↓
 Cleaning & Preprocessing
          ↓
 Validation & Normalization
          ↓
 Data Integration
          ↓
 ┌────────┬──────────┬─────────────┐
 ↓        ↓          ↓             ↓
SQL     Excel    Power BI     Python Analysis
 ↓        ↓          ↓
Queries  Analysis  Dashboard
          
          ↓
     Insights & Presentation
Main Analysis Areas
Teams
Analysis of participating teams, groups, confederations, host countries, goals, wins, losses, and overall tournament performance.
Players
Analysis of player information, positions, teams, physical attributes, and detailed performance statistics.
Matches
Analysis of match dates, tournament stages, stadiums, teams, scores, results, winners, and goal differences.
Goals
Analysis of goal events, top goal scorers, team scoring performance, and goals across tournament stages.
Match Statistics
Analysis of shots, shots on target, possession, corners, fouls, yellow cards, red cards, and offsides.
Player Performance
The project combines multiple player-statistic categories, including attacking, distribution, defending, discipline, goalkeeping, movement, and physical statistics.
Data Collection & Validation
The Python notebooks are organized as a collection pipeline:
Notebook	Purpose
01_Teams_Collection.ipynb	Collect and validate team data
02_Stadiums_Collection.ipynb	Collect and validate stadium data
03_Matches_Collection.ipynb	Collect and process match data
04_MatchStatistics_Collection.ipynb	Collect match-level statistics
05_Players_Collection.ipynb	Collect player and squad information
06_PlayerPhysicalStats_Collection.ipynb	Process player physical statistics
07_Goals_Collection.ipynb	Collect and validate goal events
08_Player Statistics.ipynb	Integrate and validate detailed player statistics


The validation process includes checks for duplicate records, missing values, invalid IDs, inconsistent team/player names, incorrect relationships, and logical ranges for statistical fields.
SQL Database
The project includes a relational SQL database design containing tables for:
- Teams
- Players
- Stadiums
- Matches
- MatchStatistics
- Goals
Foreign-key relationships are used to connect teams, players, matches, stadiums, statistics, and goal events.
The sql/ directory also contains analytical queries such as:
- Top scoring teams
- Matches played by team
- Goals by tournament stage
- Average goals per match by stage
- Team wins
- Goals conceded by team
- Top goal scorers
- Team win rate
- Goals scored vs. goals conceded
- Team match performance summaries
Power BI Dashboard
The dashboard/ directory contains the Power BI report used to visualize the integrated World Cup data.
The analytical model includes match-level and team-match fact tables designed to support interactive analysis of:
- Team performance
- Match results
- Goals
- Player statistics
- Match statistics
- Tournament stages
A Deneb visual component is also included for custom Power BI visualizations.
Excel Analysis
The excel/ directory contains the Excel analysis workbook and supporting datasets. It includes analysis related to:
- Goals by tournament stage
- Match statistics
- Player analysis
- FIFA World Cup 2026 analytical data
Presentation
The presentation/ directory contains the project presentation:
FIFA_WorldCup_2026_Presentation.pptx
It summarizes the project methodology, analysis, and key findings.
Repository Structure
FIFA_WorldCup_2026_Project/
│
├── Data/
│   ├── Teams.csv
│   ├── Players.csv
│   ├── Matches.csv
│   ├── Goals.csv
│   ├── MatchStatistics.csv
│   ├── PlayerPhysicalStats.csv
│   ├── Stadiums.csv
│   ├── FIFA_WorldCup_2026_Master_Player_Stats.csv
│   ├── FIFA_WorldCup_2026_Match_Fact.csv
│   ├── FIFA_WorldCup_2026_Match_Team_Stats.csv
│   └── FIFA_PlayerID_Mapping.csv
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
│   ├── database creation.sql
│   ├── tables creation.sql
│   ├── inserts values.sql
│   └── analytical SQL queries
│
├── excel/
│   └── FIFA_WorldCup_2026_Analysis.xlsx
│
├── dashboard/
│   ├── fifa world cup.pbix
│   └── deneb.standalone.2.0.0.0.pbiviz
│
└── presentation/
    └── FIFA_WorldCup_2026_Presentation.pptx
Technologies Used
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- REST/API Integration
- Web Scraping
- SQL / SQL Server
- Microsoft Excel
- Power BI
- Deneb / Vega-Lite
- Git & GitHub
How to Run the Python Notebooks
1. Clone the repository
git clone <your-repository-url>
cd FIFA_WorldCup_2026_Project
2. Install the required Python libraries
pip install pandas numpy matplotlib seaborn requests jupyter
Additional packages may be required depending on the notebook and data source being executed.
3. Start Jupyter Notebook
jupyter notebook
Open the Notebooks/ directory and run the notebooks in numerical order.
Some collection notebooks access external APIs. Their results may depend on API availability and the structure of the source at the time of execution.

Key Deliverables
- Cleaned and validated FIFA World Cup datasets.
- Integrated player and match analytics datasets.
- Relational SQL database and analytical queries.
- Excel analysis workbook.
- Interactive Power BI dashboard.
- Project presentation.
Project Objective
The main objective of this project is to demonstrate an end-to-end sports data analytics workflow: collecting real-world data, transforming and validating it, integrating multiple sources, designing an analytical database, and communicating insights through SQL, Excel, Power BI, and data visualization.
Author
Ahmed Elhossary
Computer Science | Data Science & AI Enthusiast

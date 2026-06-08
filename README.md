# MovieLens Analytics Pipeline on Google Cloud

## Overview

This project demonstrates the design and implementation of an end-to-end analytics pipeline using Google Cloud Platform, dbt, BigQuery, and Looker Studio.

The pipeline ingests raw MovieLens data, transforms it through a structured data warehouse architecture, and delivers business-ready datasets for analytics and reporting. The project follows modern ELT principles and implements a layered modeling approach consisting of Raw, Staging, Dimension, Fact, and Mart layers.

---

## Architecture

<img width="1693" height="929" alt="Architecture Diagram" src="https://github.com/user-attachments/assets/ac663e1f-1ffb-4714-9ba3-d03ef0130122" />

### Data Flow

```text
MovieLens Dataset
        │
        ▼
Google Cloud Storage (GCS)
        │
        ▼
BigQuery Raw Layer
        │
        ▼
dbt Staging Layer
        │
        ▼
Dimension Layer
        │
        ▼
Fact Layer
        │
        ▼
Mart Layer
        │
        ▼
Looker Studio Dashboard
```

---

## Technology Stack

| Component           | Technology                 |
| ------------------- | -------------------------- |
| Cloud Storage       | Google Cloud Storage (GCS) |
| Data Warehouse      | BigQuery                   |
| Data Transformation | dbt Core                   |
| Data Modeling       | SQL                        |
| Visualization       | Looker Studio              |
| Version Control     | Git & GitHub               |

---

## Dataset

This project uses the MovieLens 20M Dataset published by GroupLens Research.

Dataset Source:

https://grouplens.org/datasets/movielens/20m/

The dataset contains movie metadata, user ratings, tags, genome scores, and external movie references used to build analytical models and reporting datasets.

---

## Data Warehouse Architecture

### Raw Layer

The Raw Layer stores source data exactly as received from the dataset without modification.

Tables:

* raw_movies
* raw_ratings
* raw_tags
* raw_links
* raw_genome_scores
* raw_genome_tags

---

### Staging Layer

The Staging Layer performs initial standardization and preparation of raw data.

Key transformations include:

* Column renaming
* Data type standardization
* Timestamp conversion
* Data quality validation
* Consistent naming conventions

Models:

* stg_movies
* stg_ratings
* stg_tags
* stg_links
* stg_genome_scores
* stg_genome_tags

---

### Dimension Layer

Dimension models provide descriptive business entities used for analytics and reporting.

Models:

* dim_movies
* dim_users
* dim_genome_tags

Examples:

* Movie attributes
* User entities
* Tag definitions

---

### Fact Layer

Fact models store measurable business events and metrics.

Models:

* fct_ratings
* fct_genome_scores

Examples:

* User rating activity
* Genome relevance measurements

---

### Mart Layer

Mart models provide business-ready datasets optimized for reporting and dashboarding.

Models:

* mart_top_rated_movies
* mart_genre_ratings
* mart_user_engagement
* mart_tag_relevance
* mart_movie_releases

These marts serve as the primary data source for Looker Studio dashboards.

---

## dbt Implementation

The project leverages dbt to manage transformations, dependencies, and documentation.

### Features Implemented

* Source definitions
* Model dependencies using `ref()`
* Layered data modeling
* Incremental processing
* Automated lineage generation
* Documentation generation

### Materialization Strategy

| Layer     | Materialization |
| --------- | --------------- |
| Staging   | View            |
| Dimension | Table           |
| Fact      | Incremental     |
| Mart      | Table           |

### Incremental Models

The following models use incremental processing:

* fct_ratings
* fct_genome_scores

This approach reduces processing time and improves scalability for large datasets.

---

## Dashboard

<img width="953" height="707" alt="Dashboard" src="https://github.com/user-attachments/assets/42150c28-7008-4f5a-bde4-e30c181351fe" />

### Dashboard Highlights

The dashboard provides:

* Total Movies
* Total Users
* Total Ratings
* Average Rating
* Top Rated Movies
* Genre Performance Analysis
* User Engagement Metrics
* Tag Relevance Analysis

The dashboard is built using Looker Studio and is powered entirely by dbt-generated mart tables.

---

## Data Lineage

<img width="2816" height="1536" alt="dbt Lineage" src="https://github.com/user-attachments/assets/ae0c3863-4975-41ea-933e-bde24394b331" />

The lineage graph illustrates the complete dependency flow from raw ingestion through staging, dimensions, facts, and reporting marts.

---

## Business Insights

The project enables analysis across multiple business perspectives:

### Movie Performance

* Identification of top-rated movies
* Analysis of rating distributions
* Comparison of movie popularity

### Genre Analytics

* Average ratings by genre
* Genre-level performance analysis
* Audience preference trends

### User Engagement

* Most active users
* Rating behavior analysis
* User participation metrics

### Tag Analytics

* Most relevant movie tags
* Tag popularity analysis
* Content characterization insights

---

## Project Structure

```text
movielens-analytics-pipeline/

├── models/
│   ├── staging/
│   ├── dim/
│   ├── fct/
│   └── mart/
│
├── seeds/
├── snapshots/
├── macros/
├── tests/
│
├── dbt_project.yml
├── packages.yml
└── README.md
```

---

## Running the Project

### Clone Repository

```bash
git clone <repository-url>
cd movielens-analytics-pipeline
```

### Create Virtual Environment

```bash
python -m venv venv
source venv/bin/activate
```

### Install Dependencies

```bash
pip install dbt-bigquery
```

### Configure dbt Profile

Create a `profiles.yml` file under:

```text
~/.dbt/
```

Configure the following:

```yaml
movielens:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: service-account
      project: YOUR_PROJECT_ID
      dataset: movielens_staging
      location: asia-south1
      keyfile: path/to/service-account.json
```

### Execute Models

```bash
dbt run
```

### Generate Documentation

```bash
dbt docs generate
dbt docs serve
```

---

## Skills Demonstrated

* Data Warehousing
* ELT Pipeline Development
* Data Modeling
* BigQuery
* dbt
* SQL
* Incremental Data Processing
* Cloud Analytics
* Dashboard Development
* Data Lineage and Documentation

---

## Author

Viknesh

End-to-end Data Engineering project developed using Google Cloud Platform, BigQuery, dbt, and Looker Studio.

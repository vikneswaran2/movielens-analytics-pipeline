# MovieLens Analytics Pipeline

End-to-end Data Engineering project built using:

- Google Cloud Storage (GCS)
- BigQuery
- dbt
- Looker Studio

## Architecture

<img width="1693" height="929" alt="ChatGPT Image Jun 8, 2026, 12_13_41 PM" src="https://github.com/user-attachments/assets/ac663e1f-1ffb-4714-9ba3-d03ef0130122" />


---

## Data Pipeline

GCS Bucket
→ BigQuery Raw Layer
→ dbt Staging Layer
→ Dimension Layer
→ Fact Layer
→ Mart Layer
→ Looker Studio Dashboard

---
## Dataset Used
--MovieLens 20M Dataset https://grouplens.org/datasets/movielens/20m/
--Here are the file names and sizes from your screenshot:

| Name | Size |
| --- | --- |
| genome-scores.csv | 323.5 MB |
| genome-tags.csv | 18.1 KB |
| links.csv | 570.1 KB |
| movies.csv | 1.4 MB |
| ratings.csv | 533.4 MB |
| tags.csv | 16.6 MB |

## Technologies Used

- Google Cloud Platform
- BigQuery
- dbt Core
- SQL
- Looker Studio

---

## Data Warehouse Layers

### Raw Layer
Stores source MovieLens datasets.

### Staging Layer
Data cleaning and standardization.

### Dimension Layer
Movie, User, and Tag dimensions.

### Fact Layer
Ratings and Genome Score facts.

### Mart Layer
Business-ready analytics tables.




## Dashboard

<img width="953" height="707" alt="Screenshot 2026-06-08 121050" src="https://github.com/user-attachments/assets/42150c28-7008-4f5a-bde4-e30c181351fe" />


---

## dbt Lineage

<img width="2816" height="1536" alt="Gemini_Generated_Image_larhq4larhq4larh" src="https://github.com/user-attachments/assets/ae0c3863-4975-41ea-933e-bde24394b331" />

---

## Business Insights

- Top Rated Movies
- Genre Performance
- User Engagement Analysis
- Tag Relevance Analysis

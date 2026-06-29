# Physician Engagement Analytics

A comprehensive analytics pipeline built with dbt Core and Snowflake to analyze physician engagement patterns across pharmaceutical clients.

## Project Overview

This project models physician engagement data to help pharma companies identify key opinion leaders (KOLs) and optimize client relationships. The pipeline processes 500+ physicians, 20 pharmaceutical clients, and 5,000+ engagement records.

## Data Architecture

### Raw Tables (Snowflake)
- `PHYSICIANS` - Physician details (specialty, location, experience, publications)
- `PHARMA_CLIENTS` - Client company information and budgets
- `EVENTS` - Academic events and conferences
- `ENGAGEMENTS` - Physician participation records

### dbt Models (Transformations)

**Staging Models:**
- `stg_physicians` - Cleaned physician dimension
- `stg_pharma_clients` - Cleaned client dimension
- `stg_events` - Cleaned event dimension
- `stg_engagements` - Cleaned engagement facts

**Analytics Models:**
- `physician_engagement_score` - Engagement score = (conference_attendance × 0.4) + (speaking_events × 0.4) + (publications × 0.2)
- `physician_tier` - Physician classification (Tier A: >=20, Tier B: >=10, Tier C: <10)
- `client_performance` - Client metrics (physician count, avg engagement, event count)

## Dashboard

Interactive Tableau dashboard: [View Dashboard](https://public.tableau.com/authoring/PhysicianEngagementDashboard/PhysicianEngagementDashboard#1)

**Visualizations:**
- Physician distribution by tier
- Average engagement score by pharmaceutical client

## Tech Stack

- **Data Warehouse:** Snowflake
- **Transformation:** dbt Core 1.9.0
- **Visualization:** Tableau Public
- **Version Control:** Git
- **Data Generation:** Python (Faker, Pandas)

## How to Run

```bash
# Activate virtual environment
conda activate dbt-env

# Run all models
dbt run

# Run tests
dbt test

# Generate documentation
dbt docs generate
dbt docs serve
```

## Project Structure

models/

├── physician_engagement/

│   ├── sources.yml

│   ├── schema.yml

│   ├── stg_physicians.sql

│   ├── stg_engagements.sql

│   ├── stg_events.sql

│   ├── stg_pharma_clients.sql

│   ├── physician_engagement_score.sql

│   ├── physician_tier.sql

│   └── client_performance.sql

## Key Insights

- 500 physicians across 6 cities and 5 specialties
- Tier B physicians represent the majority of KOL candidates
- Pharmaceutical client average engagement scores range from 7.5-8.0
- SQL-based data quality tests ensure data integrity

## Author

Cong Xiao

## License

MIT
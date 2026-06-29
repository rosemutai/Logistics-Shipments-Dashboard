# Logistics Performance & Cost Optimization Dashboard

![Power BI Dashboard](https://github.com/rosemutai/Logistics-Shipments-Dashboard/blob/main/images/dashboard.png)

## 1. Business Problem
Logistics companies struggle to balance:
- Delivery speed
- Operational cost
- Carrier efficiency

This often leads to:
- High delivery delays
- Inefficient routes
- Increased shipping costs
  
## Objective
Develop an interactive Power BI dashboard to:
- Monitor logistics performance
- Identify inefficiencies
- Optimize cost vs delivery speed

## 2. Dataset Overview
The dataset includes:
1. Shipments (2,000+ records)
2. Carriers (FedEx, UPS, DHL, etc.)
3. Cities & Warehouses
4. Shipment & Delivery Dates
5. Cost & Distance

### Key Fields:
1. shipment_date
2. delivery_date
3. carrier
4. destination
5. origin_warehouse
6. shipping_cost
7. distance_miles
8. transit_days

## 3. Data Preparation
Performed using Power BI + DAX
#### 1. Data Cleaning:
- Standardized carrier names
- Removed null delivery dates

#### 2. Created a Date Table

#### 3. Key Metrics (KPIs)
- Total Shipments: 2K
- On-Time Delivery Rate: 82.39%
- Average Transit Time: 4 Days
- Average Cost: $205.25
- Delay Rate: 9.95%
 
## 4. Dashboard Features
**1. Performance Overview**
    - KPI cards summarizing logistics health
    - Filter panel (Carrier, City, Warehouse, Month)

**2. Trend Analysis**
    - Monthly transit time trends
    - Shipment cost trends
Transit time spikes observed in Q1, possible seasonal congestion

**3. Carrier Performance**
    - Shipment distribution by carrier
    - Identifies top and underperforming carriers
Some carriers handle high volume but show higher delays

**4. Geographic Analysis**
    - Shipment distribution by city
    - Warehouse contribution analysis
Chicago and Minneapolis cities dominate shipment volume

**5. Cost Analysis**
Cost comparison across cities
Identifies expensive shipping routes

## 5. Key Insights
#### 1. Delivery Performance Gap
On-time rate = 82%
Industry target ≈ 90%
Indicates operational inefficiency as the target was not met.

#### 2. High-Cost Cities
Cities like San Francisco show higher shipping costs
This is due to:
  - Distance
  - Demand

#### 3. Warehouse Imbalance
Some warehouses handle disproportionate volume
Risk:
  - Bottlenecks
  - Delays

#### 4. Route Efficiency Score
  - Best routes: Denver, Minneapolis, Houston, San Francisco, Miami
  - Worst routes: Detroit, Seattle, Chicago, Phoenix, Boston

#### 5. Recommendations
- Optimize Carrier Selection:
  - Shift volume to high-efficiency carriers, i.e OnTrac Crrier
  - Reduce reliance on slow carriers, i.e UPS Carrier

#### 6. Improve On-Time Delivery
- Investigate delays in high-volume routes
- Optimize warehouse processing time
  
#### 7. Cost Reduction Strategy
- Focus on high-cost cities
- Negotiate carrier pricing
  
#### 8. Balance Warehouse Load
- Redistribute shipments across warehouses

## 6. Tools & Skills Demonstrated
- Power BI
- DAX
- Data Modeling
- KPI Design
- Data Storytelling
- Business Analysis


# 📊 Super Store Sales Performance Dashboard

An interactive Power BI dashboard that analyzes Super Store sales performance across time, geography, customer segments, product categories, and shipping modes — giving decision-makers a single-page view of how the business is performing against its sales target.

![Dashboard Preview](Sales_Dashboard.png)

---

## 📌 Project Overview

The goal of this project is to turn raw retail transaction data into clear, actionable insights. The dashboard answers questions such as:

- How much are we selling, and how close are we to the sales target?
- Which months, states, and regions drive the most revenue?
- Which customer segments and product categories perform best?
- Which shipping modes do customers rely on most?

---

## 🎯 Key Performance Indicators

| KPI | Value |
|---|---|
| **Total Sales** | 2.26M |
| **Total Orders** | 5K |
| **Total Customers** | 793 |
| **Average Order Value** | 459.48 |
| **Target Sales** | 3M (2.26M achieved, ~75%) |

---

## 📈 Dashboard Components

| Visual | What it shows |
|---|---|
| **KPI Cards** | Total sales, orders, customers, and average order value at a glance |
| **Target Sales Gauge** | Progress of actual sales (2.26M) against the 3M target |
| **Monthly Sales Trend** (area/line chart) | Month-over-month sales pattern across the year |
| **Sales by State** (bar chart) | Top 10 states by sales |
| **Sales by Segment** (donut chart) | Revenue split across Consumer, Corporate, and Home Office |
| **Total Sales by Category** (column chart) | Technology vs. Furniture vs. Office Supplies |
| **Total Sales by Ship Mode** (pie chart) | Share of sales by Standard, Second, First Class, and Same Day |
| **Region Slicers** | Filter the whole dashboard by Central, East, South, or West |

---

## 🔍 Key Insights

**Sales trend**
- Sales are lowest in **February (~0.06M)** and climb through the year.
- A strong second half peaks in **November (~0.35M)**, with **December (~0.32M)** and **September (~0.30M)** also standing out — pointing to clear seasonality.

**Geography**
- **California (0.45M)** and **New York (0.31M)** lead all states, followed by Texas (0.17M), Washington (0.14M), and Pennsylvania (0.12M).

**Customer segments**
- **Consumer** is the largest segment at **1.15M (50.76%)**, followed by Corporate at 0.69M (30.44%) and Home Office at 0.42M (18.79%).

**Product categories**
- **Technology** leads at **0.83M**, ahead of Furniture (0.73M) and Office Supplies (0.71M). The three categories are fairly balanced.

**Shipping**
- **Standard Class** accounts for **1.34M (59.29%)** of sales, followed by Second Class (0.45M, 19.89%), First Class (0.35M, 15.28%), and Same Day (0.13M, 5.54%).

**Target performance**
- Sales stand at **2.26M against a 3M target**, leaving a gap of roughly 0.74M.

---

## 💡 Recommendations

- Run promotions and inventory planning ahead of the **Q4 peak** and look for ways to lift the slow early-year months.
- Double down on high-performing states (California, New York) while exploring growth in mid-tier states.
- Grow **Corporate** and **Home Office** segments, which together contribute less than half of sales.
- Review Standard Class fulfillment performance, since it handles the majority of orders.

---

## 🛠️ Tools & Technologies

- **Power BI** — data modeling, DAX measures, and dashboard design
- **Dataset** — Super Store sales data (orders, customers, products, regions, ship modes)

> Add any other tools you used (e.g., Excel, SQL, Power Query) to this list.

---

## 📂 Repository Structure

```
├── Super_Store_Sales_Dashboard.pbix   # Power BI report file
├── Sales_Dashboard.png                # Dashboard screenshot
├── data/                              # Source dataset (CSV/Excel)
└── README.md
```

---

## 🚀 How to Use

1. Clone or download this repository.
2. Open `Super_Store_Sales_Dashboard.pbix` in **Power BI Desktop**.
3. Use the **region buttons** (Central, East, South, West) to filter the dashboard.
4. Click on any chart element to cross-filter the other visuals.

---

## 👩‍💻 Author

**Bhargavi Sai Jakkana**
Data Analyst

🔗 GitHub: [github.com/Bhargavisai123](https://github.com/Bhargavisai123)

---

⭐ If you found this project useful, consider giving the repository a star!

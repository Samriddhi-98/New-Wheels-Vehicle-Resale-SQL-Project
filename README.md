# New-Wheels-Vehicle-Resale-SQL-Project

### Objective: 
To create a quarterly business report by importing data from the database and answering key leadership questions using data analysis.

### Description: 
This project is aimed at analyzing and reporting key metrics for New-Wheels, a vehicle resale company. The company has seen a decline in sales and customer satisfaction, and this project will help in understanding the root causes and providing data-driven insights.

### Business Context: 
New-Wheels is a vehicle resale company providing end-to-end services, from listing vehicles on their platform to shipping them to customers. The app also captures after-sales feedback.

### Problem Statement: 
Sales have been declining, and customer feedback is critical. The CEO requires a quarterly report with key metrics to assess the business health and make necessary decisions.

### Data Decription: 
#### Customer Information
* customer_id: Unique ID of the customer
* customer_name: Name of the customer
* gender: Gender of the customer
* job_title: Job Title of the customer
* phone_number: Contact detail of the customer
* email_address: Email address of the customer

#### Customer Location
* customer_address: Address of the customer
* city: Residing city of the customer
* state: Residing state of the customer
* country: Residing country of the customer
* postal_code: Postal Code of the customer

#### Product Information
* product_id: Unique ID of the Product
* vehicle_maker: Vehicle Manufacturing company name
* vehicle_model: Vehicle model name
* vehicle_color: Color of the Vehicle
* vehicle_model_year: Year of Manufacturing
* vehicle_price: Price of the Vehicle

#### Order Details
* order_id: Unique ID of the order
* order_date: Date on which customer ordered the vehicle
* quantity: Ordered Quantity
* discount: Discount given to the customer for the particular order by credit card in percentage
* credit_card_type: Credit Card Type
* credit_card_number: Credit card number

#### Shipping Information
* shipper_id: Unique ID of the Shipper
* shipper_name: Name of the Shipper
* shipper_contact_details: Contact details of the Shipper
* ship_date: Shipment Date
* ship_mode: Shipping Mode/Class
* shipping: Shipping Methods

#### Feedback and Performance
* customer_feedback: Feedback of the customer
* quarter_number: Quarter Number

### Data Analysis: 
#### Customer related analysis:
* The distribution of customers across states: 
  - **Highest Customer Concentration:** California and Texas lead the count with 97 customers each.
  - **Emerging Markets:** States like Colorado, Ohio, and Alabama have a modest yet significant customer base.
  - **Opportunity Areas:** Some states like Wyoming, Vermont, and Maine have minimal presence, suggesting potential for targeted growth.

* The average rating in each quarter:  Very Bad is 1, Bad is 2, Okay is 3, Good is 4, Very Good is 5
  - **Highest Rated Quarter:** Q1 had the highest average rating of **3.55**, suggesting a stronger customer experience during this period.
  - **Declining Trend:** Ratings progressively decrease across the quarters, with Q4 having the lowest average at **2.40**.
  - **Potential Areas for Improvement:** Q3 and Q4 indicate lower satisfaction levels, highlighting an opportunity to address possible concerns. 

* Customers satisfication over time:
  - **Positive Trends:** Q1 had the highest percentage of **"Very Good" ratings (30%)**, indicating strong customer satisfaction at the beginning.
  - **Declining Satisfaction:** By Q4, the percentage of **"Very Bad" ratings increased to 30.65%**, suggesting potential service or product quality concerns.
  - **Customer Engagement Patterns:** "Good" and "Okay" ratings fluctuate throughout the quarters, showing changes in customer sentiment over time.
  - **Improvement Areas:** Q3 and Q4 saw a drop in top ratings and an increase in negative feedback, pointing to areas that may need attention.

 * The top 5 vehicle makers preferred by the customer:
  - **Chevrolet Leads:** Chevrolet emerges as the most preferred vehicle maker, favored by **83 customers**.
  - **Strong Domestic Presence:** Ford, Pontiac, and Dodge maintain a solid customer base, indicating preference for American brands.
  - **Global Appeal:** Toyota ranks among the top five, showcasing strong demand for its vehicles.
  - **Close Competition:** Pontiac and Dodge tie at **50 customers**, making them competitive choices among consumers.

#### Related to Revenue and Orders: 
* The trend of number of orders by quarters:
  - Most orders were placed in 1st quarter and least orders were placed in 4th quarter.

* The quarter over quarter % change in revenue:
  - **Declining Revenue Trend:** Revenue has consistently decreased across all quarters, with the sharpest decline occurring in **Q4 (-20.18%)**.
  - **Moderate Drop in Q3:** While revenue continued to decline, Q3 saw a relatively smaller decrease at **-10.57%** compared to the prior quarter.
  - **Potential Contributing Factors:** This downward trend suggests possible market challenges, seasonal impacts, or shifts in business operations that warrant deeper analysis.

* The trend of revenue and orders by quarters:
  - **Declining Revenue Trend:** Revenue consistently decreased from **Q1 ($26.52M)** to **Q4 ($15.28M)**, indicating potential seasonal influences or demand fluctuations.
  - **Order Volume Reduction:** The number of orders follows a similar pattern, dropping from **310 orders in Q1** to **199 in Q4**.

#### Related to Shipping: 
* The average discount offered for different types of credit cards:
  - **Highest Discount Rate:** Laser credit cards receive the highest average discount of **64%**.
  - **Competitive Discounts:** Multiple card types, including **Maestro, Visa Electron, and American Express**, benefit from a **62% average discount**.
  - **Mid-Range Discounts:** Diners Club-branded cards and **Bankcard** tend to receive discounts in the **61% range**.
  - **Lower-End Discounts:** Diners Club International sees the **lowest average discount (58%)**, followed closely by **Solo (59%)**.

* The average time taken to ship the placed orders for each quarters:
  - **Fastest Shipping in Q1:** Orders placed in Q1 had the **shortest average shipping time of 57 days**, indicating efficient logistics at the start of the year.
  - **Gradual Increase in Delays:** Shipping times increased in subsequent quarters, with **Q3 reaching 117 days** and **Q4 peaking at 174 days**.
  - **Operational Concerns in Q4:** The sharp rise in **Q4's shipping time (174 days)** suggests potential supply chain challenges or increased demand causing delays.

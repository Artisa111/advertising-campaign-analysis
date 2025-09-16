# Advertising Campaign Performance Analysis Project

## Project Objective
The objective of this project is to consolidate and analyze advertising campaign data from various sources (Facebook and Google) to provide a comprehensive assessment of their monthly performance and identify significant metric changes that warrant further investigation and optimization.

## SQL Code Description
The SQL code consolidates daily advertising data from `facebook_ads_basic_daily` and `google_ads_basic_daily` tables. It groups this data by month and UTM campaign, calculating key metrics such as total spend, impressions, clicks, and value. Subsequently, derived metrics are computed: CTR (Click-Through Rate), CPC (Cost Per Click), CPM (Cost Per Mille), and ROMI (Return On Marketing Investment). Finally, the code calculates the month-over-month percentage change for CPM, CTR, and ROMI for each campaign, filtering to show only non-zero changes.

## Expected Results and Insights
The expected output is a table presenting monthly advertising campaign data with calculated performance metrics (CTR, CPC, CPM, ROMI) and their percentage changes from the previous month. This analysis enables businesses to:
* Quickly identify campaigns experiencing significant shifts in cost (CPM), engagement (CTR), or return (ROMI).
* Focus attention on campaigns that require immediate optimization or further investigation.
* Track campaign performance trends over time.
* Make more informed decisions regarding marketing budget allocation.

## Technologies Used
* SQL (PostgreSQL)
* Data Analysis (Data Consolidation, Key Metric Calculation, Time-Series Analysis)

## Output Format
The output will be a table with columns: `ad_month` (month), `utm_campaign` (campaign name), `total_spend`, `total_impressions`, `total_clicks`, `total_value`, `ctr`, `cpc`, `cpm`, `romi`, `cpm_diff_pct` (percentage change in CPM), `ctr_diff_pct` (percentage change in CTR), `romi_diff_pct` (percentage change in ROMI). The data will be ordered by month and campaign name.

# פרויקט ניתוח ביצועי קמפיינים פרסומיים

## מטרת הפרויקט
מטרת פרויקט זה היא לאחד ולנתח נתונים של קמפיינים פרסומיים ממקורות שונים (פייסבוק וגוגל), במטרה לספק הערכה מקיפה של ביצועיהם החודשיים ולזהות שינויים משמעותיים במדדים המצריכים חקירה ואופטימיזציה נוספת.

## תיאור קוד ה-SQL
קוד ה-SQL מאחד נתוני פרסום יומיים מטבלאות `facebook_ads_basic_daily` ו-`google_ads_basic_daily`. הוא מקבץ נתונים אלה לפי חודש וקמפיין UTM, ומחשב מדדי מפתח כגון סך הוצאות (`total_spend`), חשיפות (`total_impressions`), קליקים (`total_clicks`) וערך (`total_value`). לאחר מכן, מחושבים מדדים נגזרים: CTR (שיעור הקלקה), CPC (עלות לקליק), CPM (עלות לאלף חשיפות) ו-ROMI (החזר השקעה שיווקית). לבסוף, הקוד מחשב את השינוי באחוזים מחודש לחודש עבור CPM, CTR ו-ROMI לכל קמפיין, ומסנן כדי להציג רק שינויים שאינם אפס.

## תוצאות ותובנות צפויות
התוצאה הצפויה היא טבלה המציגה נתונים חודשיים של קמפיינים פרסומיים עם מדדי ביצועים מחושבים (CTR, CPC, CPM, ROMI) ושינויי האחוזים שלהם מהחודש הקודם. ניתוח זה מאפשר לעסקים:
* לזהות במהירות קמפיינים החווים שינויים משמעותיים בעלות (CPM), במעורבות (CTR) או בהחזר (ROMI).
* למקד תשומת לב בקמפיינים הדורשים אופטימיזציה מיידית או חקירה נוספת.
* לעקוב אחר מגמות ביצועי קמפיינים לאורך זמן.
* לקבל החלטות מושכלות יותר לגבי הקצאת תקציב שיווקי.

## טכנולוגיות בשימוש
* SQL (PostgreSQL)
* ניתוח נתונים (איחוד נתונים, חישוב מדדי מפתח, ניתוח סדרות זמן)

## פורמט פלט
הפלט יהיה טבלה עם עמודות: `ad_month` (חודש), `utm_campaign` (שם קמפיין), `total_spend`, `total_impressions`, `total_clicks`, `total_value`, `ctr`, `cpc`, `cpm`, `romi`, `cpm_diff_pct` (שינוי אחוזים ב-CPM), `ctr_diff_pct` (שינוי אחוזים ב-CTR), `romi_diff_pct` (שינוי אחוזים ב-ROMI). הנתונים יהיו ממוינים לפי חודש ושם קמפיין.

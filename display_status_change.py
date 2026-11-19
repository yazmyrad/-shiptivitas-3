import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

engine = create_engine("sqlite:///shiptivity.db")

# 2. Read your .sql file and split into individual statements
with open("answer.sql") as f:
    sql = f.read()

# 3. Run a single query straight into a DataFrame
df = pd.read_sql(sql, engine)
print(df.head())

# 4. Chart
plt.figure(figsize=(8, 5))
plt.bar(df["cardID"], df["number_of_changes"])
plt.title("Number of status changes by card")
plt.ylabel("Number of changes")
plt.savefig("status_change.png", dpi=150, bbox_inches="tight")
plt.show()
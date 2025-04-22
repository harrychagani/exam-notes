# Numpy



1. Create a 3D array of integer in range of 1 to 10 with shape (2, 3, 4) using random generator np.random.default_rng(seed=42), flatten it into a 1D array using NumPy. What is the shape of the resulting array?

```python
import numpy as np

rng = np.random.default_rng(seed=42)
array = rng.integers(1, 10, size=(2, 3, 4))

flattened_array = array.flatten()

print("Shape of the flattened array:", flattened_array.shape)


```

2.Create a random integer array of 1 to 10 with shape (2, 3, 4) using random generator np.random.default_rng(seed=42) and reshape it to (4, 6). Verify the total number of elements remains the same.(True/False)

```python
rng = np.random.default_rng(seed=42)
array = rng.integers(1,10,size = (2,3,4))

re_shape = array.reshape(4,6)

print("reshape size = " , re_shape.size)
print("array size = " , array.size)
```

```python
rng = np.random.default_rng(seed=42)
arr = rng.integers(1, 10, size=(2, 3, 4))
reshaped_arr = arr.reshape((4, 6))

print("Actual Array\n", arr)
print("Reshaped array\n", reshaped_arr)
print("Reshaped shape:", reshaped_arr.shape)
print("Actual array size:", arr.size)
print("Reshaped size:", reshaped_arr.size)



```

3.Create two 1D float arrays(values in range of 1- 15) of 5 random integers each using random states (45 and 46). Compute their dot product.


```python
rng1 = np.random.default_rng(seed=45)
rng2 = np.random.default_rng(seed=46)


arr1 = rng1.uniform(1, 15, size=5)
arr2 = rng2.uniform(1, 15, size=5)


dot_product = np.dot(arr1, arr2)

print("Array 1:", arr1)
print("Array 2:", arr2)
print("Dot Product:", dot_product)


```

```python
rng1.u
```

4.Given A and B , perform matrix multiplication

 Matrix A (3×2):

\begin{bmatrix}
9 & 4 \\
6 & 2 \\
8 & 8 \\
\end{bmatrix}

 Matrix B (2×4):

\begin{bmatrix}
5 & 6 & 2 & 3 \\
6 & 3 & 4 & 1 \\
\end{bmatrix}



```python
A = np.array([[9,4],[6,2],[8,8]])
A.shape
```

```python
B = np.array([[5,6,2,3],[6,3,4,1]])
B.shape
```

```python
A@B
```

```python
np.matmul(A,B)
```

5. For given array created with code 'np.arange(2 * 4 * 4).reshape(2, 4, 4), extract every alternate row and column from each layer.

```python
array=np.arange(2 * 4 * 4).reshape(2, 4, 4)
array
```

```python
array[:, ::2, ::2]


```

6.For given array created with code 'np.arange(2 * 4 * 4).reshape(2, 4, 4), extract first element in second dimension and 3rd element in 3rd dimension

```python
array
```

```python
 array[:, 0, :]
```

```python
 array[:, 0, 3]

```

7.For given array created with code 'np.arange(2 * 4 * 4).reshape(2, 4, 4).If you  extract first&second element in second dimension, What is output dimension?

```python
array[1, 0:2, :]
```

```python
array[:, 0:2, :].shape
```

# Pandas

```python

import warnings
warnings.filterwarnings("ignore")

import pandas as pd
import io
import requests

df_url = 'https://raw.githubusercontent.com/aishwarya13-r/DAB111-Data/refs/heads/main/people_info.csv'
url_content = requests.get(df_url, verify=False).content
person = pd.read_csv(io.StringIO(url_content.decode('utf-8')))
```

```python
person
```

1.create column Age and add the values in ages list [29, 32, 41, 38, 27, 45, 31, 36, 33, 39] to person dataframe where index maps to respective person's age

```python
# Step 2: Create a separate list for Age
ages = [29, 32, 41, 38, 27, 45, 31, 36, 33, 39]

# Step 3: Add Age column to the DataFrame
person["Age"] = ages
```

```python
person

```

1. Use person data,Standardize the Age column using the formula:

`scaledage = (age − mean age) / std of age `

What is the resulting value for "Bob" after scaling?

```python
age_mean = person['Age'].mean()
age_std = person['Age'].std()
person['Age_scaled'] = (person['Age'] - age_mean) / age_std


person.loc[person['First Name'] == 'Bob', 'Age_scaled']
```

2. Select all rows where: Profession contains the word "Engineer" OR Age is greater than 35. How many rows meet the condition?

```python
p_fil =person[(person['Profession'].str.contains("Engineer")) | (person['Age'] > 35)]
print("Filtered :\n", p_fil,"\nNo of records filtered:",len(p_fil))
```

3.Use Person data, add a new column AgeGroup:

"Young" if age < 30

"Mid" if 30–40

"Senior" if > 40
How many people fall into each age group?



```python
def age_group(age):
    if age < 30:
        return "Young"
    elif age <= 40:
        return "Mid"
    else:
        return "Senior"

person['AgeGroup'] = person['Age'].apply(age_group)
print("Age group counts:\n", person['AgeGroup'].value_counts())

```

4. Map the sex column using dictonary

```
{"Male": "M", "Female": "F"}

```
What is the ratio of M and F?



```python
person['Sex'] = person['Sex'].map({"Male": "M", "Female": "F"})

sex_ratio = person['Sex'].value_counts(normalize=True)
sex_ratio
```

```python
person['Sex'].value_counts()/len(person)

```

5.Get only numeric columns

6.Get only object (non-numeric) columns
How many columns does each return?



```python
 person.select_dtypes(include='number')

```

```python
 person.select_dtypes(exclude='number')
```

7.For person dataset provide numerical represntation for age group and save to json

```python
person["AgeGroup_Code"] = person["AgeGroup"].astype("category").cat.codes
person
```

```python
#If order is specified ["Young", "Mid", "Senior"]
person["AgeGroup"] = pd.Categorical(person["AgeGroup"], categories=["Young", "Mid", "Senior"], ordered=True)


person["AgeGroup_Code"] = person["AgeGroup"].cat.codes
person
```

```python
person.to_json("person.json",  indent=2)

```

#SQLite

Read the data from csv using below code and add the data to SQLite table and perform task listed below,

1.Update:
Bob has recently changed jobs and is now a "Software Engineer" aged 35.
Write the SQL command to update his record.

2.Delete:
Write a SQL statement to delete all records of people whose age is below 25.

3.Add Column:
Add a new column called Country with default value "Canada" to the person table.

```
import warnings
warnings.filterwarnings("ignore")

import pandas as pd
import io
import requests
import sqlite3

df_url = 'https://raw.githubusercontent.com/aishwarya13-r/DAB111-Data/refs/heads/main/people_info.csv'
url_content = requests.get(df_url, verify=False).content
person = pd.read_csv(io.StringIO(url_content.decode('utf-8')))
```



```python
import warnings
warnings.filterwarnings("ignore")

import pandas as pd
import io
import requests
import sqlite3

df_url = 'https://raw.githubusercontent.com/aishwarya13-r/DAB111-Data/refs/heads/main/people_info.csv'
url_content = requests.get(df_url, verify=False).content
person = pd.read_csv(io.StringIO(url_content.decode('utf-8')))

# Connect to SQLite and load table
conn = sqlite3.connect('people.db')
person.to_sql('person', conn, if_exists='replace', index=False)

update_query = """
UPDATE person 
SET Job = 'Software Engineer', Age = 35 
WHERE Name = 'Bob';
"""
conn.execute(update_query)
conn.commit()

delete_query = """
DELETE FROM person 
WHERE Age < 25;
"""
conn.execute(delete_query)
conn.commit()

# Add column
conn.execute("ALTER TABLE person ADD COLUMN Country TEXT;")
# Update new column
conn.execute("UPDATE person SET Country = 'Canada';")
conn.commit()

df_updated = pd.read_sql_query("SELECT * FROM person;", conn)
df_updated.head()
```
````

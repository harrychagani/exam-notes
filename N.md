# Numpy

1. Create a 3D array of integers in range 1–10 with shape (2, 3, 4), flatten it to 1D, and print the shape.
```python
import numpy as np

rng = np.random.default_rng(seed=42)
array = rng.integers(1, 10, size=(2, 3, 4))
flattened_array = array.flatten()
print("Shape of the flattened array:", flattened_array.shape)
```

2. Reshape the same array to (4, 6) and verify if total elements remain unchanged.
```python
rng = np.random.default_rng(seed=42)
array = rng.integers(1,10,size = (2,3,4))
re_shape = array.reshape(4,6)
print("reshape size = " , re_shape.size)
print("array size = " , array.size)
```

3. Compute dot product of two float arrays created using seeds 45 and 46.
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

4. Matrix multiplication of A (3x2) and B (2x4)
```python
A = np.array([[9,4],[6,2],[8,8]])
B = np.array([[5,6,2,3],[6,3,4,1]])
print(np.matmul(A,B))
```

5. Extract every alternate row and column from each layer of array (2, 4, 4)
```python
array = np.arange(2 * 4 * 4).reshape(2, 4, 4)
print(array[:, ::2, ::2])
```

6. Extract first row and 3rd column
```python
print(array[:, 0, :])
print(array[:, 0, 3])
```

7. Extract slices and check shape
```python
print(array[:, 0:2, :].shape)
```

# Pandas
```python
import warnings
warnings.filterwarnings("ignore")
import pandas as pd
import io, requests

df_url = 'https://raw.githubusercontent.com/aishwarya13-r/DAB111-Data/refs/heads/main/people_info.csv'
url_content = requests.get(df_url, verify=False).content
person = pd.read_csv(io.StringIO(url_content.decode('utf-8')))
```

1. Add Age column
```python
ages = [29, 32, 41, 38, 27, 45, 31, 36, 33, 39]
person["Age"] = ages
```

2. Standardize age
```python
age_mean = person['Age'].mean()
age_std = person['Age'].std()
person['Age_scaled'] = (person['Age'] - age_mean) / age_std
print(person.loc[person['First Name'] == 'Bob', 'Age_scaled'])
```

3. Filter rows where Profession has "Engineer" or Age > 35
```python
p_fil = person[(person['Profession'].str.contains("Engineer")) | (person['Age'] > 35)]
print(p_fil, "\nCount:", len(p_fil))
```

4. Add AgeGroup and count each group
```python
def age_group(age):
    if age < 30:
        return "Young"
    elif age <= 40:
        return "Mid"
    else:
        return "Senior"
person['AgeGroup'] = person['Age'].apply(age_group)
print(person['AgeGroup'].value_counts())
```

5. Map "Male" and "Female" to "M" and "F", and calculate ratio
```python
person['Sex'] = person['Sex'].map({"Male": "M", "Female": "F"})
print(person['Sex'].value_counts(normalize=True))
```

6. Get numeric and non-numeric columns
```python
print(person.select_dtypes(include='number').shape[1])
print(person.select_dtypes(exclude='number').shape[1])
```

7. Create categorical code for AgeGroup and save to JSON
```python
person["AgeGroup"] = pd.Categorical(person["AgeGroup"], categories=["Young", "Mid", "Senior"], ordered=True)
person["AgeGroup_Code"] = person["AgeGroup"].cat.codes
person.to_json("person.json", indent=2)
```

# SQLite
```python
import sqlite3

conn = sqlite3.connect('people.db')
person.to_sql('person', conn, if_exists='replace', index=False)

# Update
conn.execute("UPDATE person SET Job = 'Software Engineer', Age = 35 WHERE Name = 'Bob';")
conn.commit()

# Delete
conn.execute("DELETE FROM person WHERE Age < 25;")
conn.commit()

# Add column and set default
conn.execute("ALTER TABLE person ADD COLUMN Country TEXT;")
conn.execute("UPDATE person SET Country = 'Canada';")
conn.commit()

df_updated = pd.read_sql_query("SELECT * FROM person;", conn)
print(df_updated.head())
```

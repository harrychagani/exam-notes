## 📝 Python Exam – Questions and Answers

**Q1:** Write a function named `even_squared` that takes in a list of integers, squares each even number, and returns the sum of the squared even numbers. If there are no even numbers, return 0. If the list is empty, raise an `AssertionError`. If a non-integer is present, raise a `TypeError`.  
```python
def even_squared(lst):
    assert lst, "List is empty"
    if not all(isinstance(x, int) for x in lst):
        raise TypeError("All elements must be integers")
    even_squares = [x**2 for x in lst if x % 2 == 0]
    return sum(even_squares) if even_squares else 0
```

**Q2:** Given the classes A(D), Z(K), K(D), G(A), which statement is not true? ✅ `K is a child class of A`

**Q3:** Create a new column `description_count` that counts words in the `description` column.  
```python
rent['description_count'] = rent['description'].apply(lambda x: len(str(x).split()))
```

**Q4:** Insert only numeric columns of the bulldozer dataset into SQLite and retrieve the first 5 rows.  
```python
import sqlite3
conn = sqlite3.connect('auction.db')
bdims_numeric = bdims.select_dtypes(include='number')
bdims_numeric.to_sql('bulldozer', conn, if_exists='replace', index=False)
conn.commit()
result = pd.read_sql_query("SELECT * FROM bulldozer LIMIT 5;", conn)
conn.close()
```

**Q5:** Proper f-string implementation:  
```python
f"The values of the variables are var1={var1} and var2={var2}."
```

**Q6:** Dot product result from seeded arrays → ✅ `-65748`

**Q7:** Matrix multiplication value at position [6, 28] using seed 68 → ✅ `8.406180491545276`

**Q8:** Which is NOT iterable? ✅ `float`

**Q9:** Define a class `Restaurant` with attributes, class method, and make it iterable.  
```python
class Restaurant:
    owner = "Unknown"

    def __init__(self, name, tel_number):
        self.name = name
        self.tel_number = tel_number

    @classmethod
    def update_owner(cls, new_owner):
        cls.owner = new_owner

    def __iter__(self):
        return iter([self.name, self.tel_number])
```

**Q10:** Output of AND → NOR logic gates for 2 input sets → ✅ `[False, True]`

**Q11:** A `while` loop is useful when: ✅ `indefinite number of iterations`

**Q12:** To pass dictionary `a` as keyword arguments → ✅ `**a`

**Q13:** Access `"Avalon Cafe and Bakery"` from `json_data` →  
```python
json_data['restaurants'][0]['name']
```

**Q14:** Select `-14` from list `x` using positive indexing → ✅ `x[4][1]`

**Q15:** Create `building_id_count` that maps building ID to count →  
```python
rent['building_id_count'] = rent['building_id'].map(rent['building_id'].value_counts())
```

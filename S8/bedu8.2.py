# Conectar a MongoDB y obtener los datos
from pymongo import MongoClient
import pandas as pd

MONGO_DB_URL = 'mongodb+srv://introadb:QFMZNdq5RtpRjtzO@cluster0.ijbvb.mongodb.net/'
client = MongoClient(MONGO_DB_URL)
db = client['sesion8']
collection = db['metro_cdmx']

data = list(collection.find())
df = pd.DataFrame(data)

# Mostrar las primeras filas del DataFrame
print(df.head())

# ----------------------------------------------------

# Análisis exploratorio y visualizaciones
import matplotlib.pyplot as plt

# Eliminar la columna '_id'
if '_id' in df.columns:
    df.drop('_id', axis=1, inplace=True)

# Estadísticas descriptivas
print("Estadísticas descriptivas:")
print(df.describe())

# ---------------------------------------------------
# Gráficos
plt.figure(figsize=(10, 6))
df['afluencia'].plot(kind='hist', bins=50, title='Distribución de Afluencia')
plt.xlabel('Afluencia')
plt.ylabel('Frecuencia')
plt.show()

plt.figure(figsize=(10, 6))
df.groupby('linea')['afluencia'].mean().plot(kind='bar', title='Afluencia Promedio por Línea')
plt.xlabel('Línea')
plt.ylabel('Afluencia Promedio')
plt.show()

plt.figure(figsize=(15, 8))
df.groupby('estacion')['afluencia'].sum().plot(kind='bar', title='Afluencia Total por Estación')
plt.xlabel('Estación')
plt.ylabel('Afluencia Total')
plt.show()

# ---------------------------------------------------

# Análisis adicional utilizando agregaciones
# Afluencia promedio por mes
pipeline = [
    {"$group": {"_id": "$mes", "afluencia_promedio": {"$avg": "$afluencia"}}},
    {"$sort": {"_id": 1}}
]
result = list(collection.aggregate(pipeline))
df_monthly = pd.DataFrame(result)

plt.figure(figsize=(10, 6))
plt.bar(df_monthly['_id'], df_monthly['afluencia_promedio'])
plt.xlabel('Mes')
plt.ylabel('Afluencia Promedio')
plt.title('Afluencia Promedio por Mes')
plt.show()

# Afluencia total por tipo de pago
pipeline = [
    {"$group": {"_id": "$tipo_pago", "afluencia_total": {"$sum": "$afluencia"}}},
    {"$sort": {"afluencia_total": -1}}
]
result = list(collection.aggregate(pipeline))
df_payment = pd.DataFrame(result)

plt.figure(figsize=(10, 6))
plt.bar(df_payment['_id'], df_payment['afluencia_total'])
plt.xlabel('Tipo de Pago')
plt.ylabel('Afluencia Total')
plt.title('Afluencia Total por Tipo de Pago')
plt.show()

import pandas as pd


for i in range(0, 11):
    # CSV dosyasını yükle
    df = pd.read_csv(f"C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\oneToMany\\filtered_group_{i+1}.csv")  # Başlık yoksa header=None kullanılır.

    # Boş hücreleri NULL ile değiştirme
    df = df.map(lambda x: 'NULL' if pd.isna(x) or str(x).strip() == '' else x)

    # Düzenlenmiş CSV'yi kaydet
    df.to_csv(f"C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\nullOneToMany\\filtered_group_{i+1}.csv", index=False)


import pandas as pd

for i in range(0,11):
    # CSV dosyasını yükleyin
    file_path = f"C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\nullOneToMany\\filtered_group_{i+1}.csv"  # CSV dosyanızın adı veya yolu
    df = pd.read_csv(file_path)

    # Null değer içeren herhangi bir satırı sil
    df_cleaned = df.dropna()

    # Temizlenmiş DataFrame'i yeni bir dosyaya kaydet
    output_file_path = f"C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\deletedDatas\\filtered_group_{i+1}.csv" 
    df_cleaned.to_csv(output_file_path, index=False)

    print(f"Temizlenmiş dosya kaydedildi: {output_file_path}")



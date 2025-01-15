import pandas as pd


for i in range(0, 7):
# CSV dosyasını yükle
    input_file = f"C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\nullOneToMany\\filtered_group_{i+1}.csv"
    output_file = f"C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\lastDatas\\filtered_group_{i+1}.csv"  # Çıkış dosyasının adı

    # CSV'yi DataFrame olarak yükle
    df = pd.read_csv(input_file, na_values='NA')  # NA değerlerini tanımla

    # NA değerlerini NULL ile değiştir
    df.fillna('NULL', inplace=True)

    # Yeni CSV dosyasına kaydet
    df.to_csv(output_file, index=False)

    print(f"NA değerleri NULL olarak değiştirildi ve {output_file} dosyasına kaydedildi.")
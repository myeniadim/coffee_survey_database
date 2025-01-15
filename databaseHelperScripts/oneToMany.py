import pandas as pd
import re

def split_outside_parentheses(cell):
    """
    Parantez dışındaki virgüllere göre hücreyi ayırır.
    Parantez içindeki virgülleri korur.
    """
    if not isinstance(cell, str) or ',' not in cell:
        return [cell]
    
    # Parantez içindeki virgülleri korumak için regex kullanıyoruz
    parts = re.split(r',(?![^(]*\))', cell)  # Parantez dışındaki virgüllere göre böl
    return [part.strip() for part in parts]  # Boşlukları temizle ve liste döndür

# CSV dosyasını yükle
for i in range(0, 11):
    input_file = f"C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\parsedCsv\\filtered_group_{i+1}.csv"
    output_file = f"C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\oneToMany\\filtered_group_{i+1}.csv"

    # CSV dosyasını pandas ile oku
    df = pd.read_csv(input_file)

    # Düzenlenmiş satırları saklayacağımız bir liste
    expanded_rows = []

    # Her satır üzerinde döngü yap
    for _, row in df.iterrows():
        split_rows = [row]  # İlk satır orijinal olarak başlar
        
        for col in df.columns:
            if ',' in str(row[col]):  # Hücreyi kontrol et
                split_values = split_outside_parentheses(row[col])  # Parantez dışındaki virgülleri ayır
                temp_rows = []
                for value in split_values:
                    for split_row in split_rows:
                        new_row = split_row.copy()
                        new_row[col] = value
                        temp_rows.append(new_row)
                split_rows = temp_rows
        
        expanded_rows.extend(split_rows)

    # Yeni DataFrame oluştur
    expanded_df = pd.DataFrame(expanded_rows).drop_duplicates()

    # Yeni CSV dosyasına yaz
    expanded_df.to_csv(output_file, index=False)

    print(f"Düzenlenmiş dosya {output_file} olarak kaydedildi.")

import pandas as pd

# CSV dosyasını yükleme
dosya_yolu = 'C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\nullCsv\\coffee_survey.csv'
veriler = pd.read_csv(dosya_yolu)

# Ayırmak istediğiniz sütun grupları
sütun_gruplari = [
    ['submission_id', 'where_drink'],
    ['submission_id', 'brew'],
    ['submission_id', 'brew_other'],
    ['submission_id', 'why_drink'],
    ['submission_id', 'why_drink_other'],
    ['submission_id', 'purchase'],
    ['submission_id', 'purchase_other'],
    ['submission_id', 'additions'],
    ['submission_id', 'additions_other'],
    ['submission_id', 'sweetener'],
    ['submission_id', 'dairy']
]

# Çıkış klasörü
cikis_klasoru = "C:\\Users\\myeni\\OneDrive\\Masaüstü\\Python Projects\\databaseHelperScripts\\parsedCsv\\"

# Her sütun grubunu ayrı bir dosyaya yaz
for i, grup in enumerate(sütun_gruplari, start=1):
    try:
        # Sütunları filtreleme
        filtrelenmis_veriler = veriler[grup]
        
        # Dosya adını oluşturma
        cikis_dosyasi = f"{cikis_klasoru}filtered_group_{i}.csv"
        
        # Dosyayı kaydetme
        filtrelenmis_veriler.to_csv(cikis_dosyasi, index=False)
        
        print(f"{cikis_dosyasi} başarıyla oluşturuldu.")
    except KeyError as e:
        print(f"Hata: {e}. {grup} sütunları bulunamadı.")

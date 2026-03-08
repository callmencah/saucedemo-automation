# 🤖 SauceDemo Automation Test — Robot Framework

[![UI Tests](https://github.com/callmencah/saucedemo-automation/actions/workflows/robot-tests.yml/badge.svg)](https://github.com/callmencah/saucedemo-automation/actions/workflows/robot-tests.yml)

Automation test untuk aplikasi **[SauceDemo](https://www.saucedemo.com/)** menggunakan **Robot Framework** dengan **SeleniumLibrary**.


## 📁 Struktur Project

```
saucedemo-automation/
├── tests/                              # Test suites
│   ├── 01_login.robot                  # Login feature tests (5 TC)
│   ├── 02_product_list.robot           # Product list page tests (5 TC)
│   ├── 03_add_to_cart.robot            # Add to cart tests (5 TC)
│   ├── 04_checkout.robot               # Checkout flow tests (6 TC)
│   └── 05_logout.robot                 # Logout tests (2 TC)
├── resources/
│   ├── keywords/                       # Reusable keywords
│   │   ├── common_keywords.robot       # Common utility keywords
│   │   ├── login_keywords.robot        # Login-specific keywords
│   │   ├── product_keywords.robot      # Product page keywords
│   │   ├── cart_keywords.robot         # Cart keywords
│   │   ├── checkout_keywords.robot     # Checkout keywords
│   │   └── logout_keywords.robot       # Logout keywords
│   ├── locators/
│   │   └── locators.robot              # Centralized element locators
│   └── test_data/
│       └── test_data.robot             # Test data variables
├── results/                            # Test reports (auto-generated, git-ignored)
├── requirements.txt                    # Python dependencies
├── .gitignore
└── README.md
```

---

## ⚙️ Prasyarat (Prerequisites)

Pastikan perangkat Anda sudah memiliki:

| Software | Versi Minimum | Link Download |
|----------|---------------|---------------|
| **Python** | 3.8+ | [python.org/downloads](https://www.python.org/downloads/) |
| **pip** | (sudah termasuk di Python) | - |
| **Google Chrome** | Versi terbaru | [google.com/chrome](https://www.google.com/chrome/) |

> ⚠️ **Penting:** Saat install Python, pastikan mencentang **☑ "Add Python to PATH"**

### Verifikasi Instalasi

```bash
python --version    # Harus menampilkan Python 3.x.x
pip --version       # Harus menampilkan pip xx.x.x
```

---

## 🚀 Cara Penggunaan (Getting Started)

### 1. Clone Repository

```bash
git clone https://github.com/callmencah/saucedemo-automation.git
cd saucedemo-automation
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

Ini akan menginstall:
- `robotframework` — Framework utama untuk automation test
- `robotframework-seleniumlibrary` — Library untuk browser automation
- `selenium` — WebDriver untuk mengontrol browser
- `webdrivermanager` — Otomatis mengelola ChromeDriver

### 3. Jalankan Semua Test

```bash
robot --outputdir results tests/
```

> Setelah test selesai, browser Chrome akan terbuka dan tertutup secara otomatis untuk setiap test suite.

### 4. Lihat Hasil Test

Setelah eksekusi selesai, buka file report:

```bash
# Windows
start results/report.html

# Mac/Linux
open results/report.html
```

File yang dihasilkan di folder `results/`:
| File | Keterangan |
|------|------------|
| `report.html` | Ringkasan visual hasil test |
| `log.html` | Detail log per test step |
| `output.xml` | Output XML untuk integrasi CI/CD |

---

## 📖 Perintah Berguna

### Jalankan Test Suite Tertentu

```bash
# Hanya Login tests
robot --outputdir results tests/01_login.robot

# Hanya Checkout tests
robot --outputdir results tests/04_checkout.robot
```

### Jalankan Test Berdasarkan Tag

```bash
# Hanya smoke tests
robot --outputdir results --include smoke tests/

# Hanya critical tests
robot --outputdir results --include critical tests/

# Exclude medium priority
robot --outputdir results --exclude medium tests/
```

### Jalankan dalam Mode Headless (Tanpa Tampilan Browser)

```bash
robot --outputdir results --variable BROWSER:headlesschrome tests/
```

---

## 🏷 Tags Referensi

| Tag | Keterangan |
|-----|------------|
| `smoke` | Test kritis yang harus dijalankan setiap build |
| `critical` | Test prioritas sangat tinggi |
| `high` | Test prioritas tinggi |
| `medium` | Test prioritas sedang |
| `positive` | Skenario positif (happy path) |
| `negative` | Skenario negatif (error handling) |
| `login` | Fitur login |
| `products` | Halaman produk |
| `cart` | Keranjang belanja |
| `checkout` | Alur checkout |
| `logout` | Fitur logout |

---

## 📊 Test Coverage

| # | Feature | File | Test Cases | Skenario |
|---|---------|------|-----------|----------|
| 1 | Login | `01_login.robot` | 5 | Valid, invalid, locked, empty username, empty password |
| 2 | Product List | `02_product_list.robot` | 5 | Page display, list not empty, product info, known products, count |
| 3 | Add to Cart | `03_add_to_cart.robot` | 5 | Single add, multiple add, verify in cart, multiple verify, remove |
| 4 | Checkout | `04_checkout.robot` | 6 | Complete flow, empty first/last/postal, all empty, overview |
| 5 | Logout | `05_logout.robot` | 2 | Redirect to login, login elements visible |
| | **Total** | | **23** | |

---

## 🔧 Troubleshooting

### Chrome Password Manager Popup
Jika muncul popup "Change your password" dari Google Password Manager, automation ini sudah menanganinya secara otomatis melalui Chrome options yang menonaktifkan password manager.

### ChromeDriver Version Mismatch
Jika error `SessionNotCreatedException`, pastikan versi ChromeDriver sesuai dengan versi Chrome:
```bash
# Cek versi Chrome
chrome --version

# Update ChromeDriver
pip install --upgrade webdriver-manager
```

### Element Not Found / Timeout
Jika test gagal karena element tidak ditemukan:
- Pastikan koneksi internet stabil
- Coba jalankan ulang test
- Periksa apakah website SauceDemo sedang online

---

## 🛠 Tech Stack

- **Robot Framework** — Test automation framework
- **SeleniumLibrary** — Browser automation
- **Python** — Runtime environment
- **Google Chrome** — Target browser

---

## 📝 Catatan

- Test menggunakan kredensial bawaan SauceDemo: `standard_user` / `secret_sauce`
- Test dirancang untuk berjalan secara independen (setiap test bisa dijalankan sendiri)
- Hasil test (`results/`) tidak di-commit ke repository

---

## 👤 Author

**Nurcahyadi**

---
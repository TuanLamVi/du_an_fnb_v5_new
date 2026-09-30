$root = "C:\Users\Admin\Desktop\Android\ho so du an fnb"

# 1. Create new standard folders 00 to 18
$newGroups = @(
    "00_tong_quan_va_quan_ly",
    "01_yeu_cau_san_pham",
    "02_ux_ui_va_man_hinh",
    "03_quy_tac_nghiep_vu_va_trang_thai",
    "04_kien_truc_va_ky_thuat",
    "05_co_so_du_lieu_va_du_lieu",
    "06_bao_mat_phan_quyen",
    "07_kiem_thu_nghiem_thu",
    "08_phat_hanh_va_van_hanh",
    "09_truy_xuat_tinh_nang",
    "10_work_item",
    "11_quan_ly_tai_lieu",
    "12_ke_hoach_va_tien_do",
    "13_nhat_ky_thuc_thi",
    "14_rui_ro_loi_thay_doi_quyet_dinh",
    "15_bang_chung_va_bao_cao",
    "16_huong_dan_su_dung",
    "17_baseline",
    "18_trung_tam_dieu_hanh_3_ben"
)

foreach ($g in $newGroups) {
    $dir = Join-Path $root $g
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
    }
}

# Subfolders for 18_trung_tam_dieu_hanh_3_ben
$ocSub = @(
    "18_trung_tam_dieu_hanh_3_ben\01_luat_van_hanh_3_ben",
    "18_trung_tam_dieu_hanh_3_ben\02_bang_dieu_hanh",
    "18_trung_tam_dieu_hanh_3_ben\03_nhat_ky_giam_sat",
    "18_trung_tam_dieu_hanh_3_ben\04_bao_cao_giam_sat",
    "18_trung_tam_dieu_hanh_3_ben\05_bang_chung",
    "18_trung_tam_dieu_hanh_3_ben\06_dong_bo_github"
)

foreach ($sub in $ocSub) {
    $dir = Join-Path $root $sub
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
    }
}

Write-Host "Folders created successfully."

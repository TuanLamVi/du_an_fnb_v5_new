$root = "C:\Users\Admin\Desktop\Android\ho so du an fnb"
$groups = @(
    "00_tong_quan_va_quan_ly",
    "01_san_pham",
    "02_ux_ui",
    "03_quy_tac_nghiep_vu",
    "04_kien_truc_ky_thuat",
    "05_co_so_du_lieu",
    "06_bao_mat_phan_quyen",
    "07_kiem_thu_nghiem_thu",
    "08_traceability",
    "09_ke_hoach_thuc_thi",
    "10_quan_ly_tien_do",
    "11_nhat_ky_du_an",
    "12_quan_ly_loi_va_su_co",
    "13_quan_ly_thay_doi",
    "14_rui_ro_va_quyet_dinh",
    "15_release_van_hanh",
    "16_audit",
    "17_baseline"
)

foreach ($g in $groups) {
    $dir = Join-Path $root $g
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
    }
}

$mapping = @{
    'danh_muc_bo_ho_so.md' = '00_tong_quan_va_quan_ly'
    'tong_quan_du_an.md' = '00_tong_quan_va_quan_ly'
    'quy_dinh_quan_ly_ho_so.md' = '00_tong_quan_va_quan_ly'
    'ban_do_nguon_su_that.md' = '00_tong_quan_va_quan_ly'
    'danh_muc_tong_the_ho_so.md' = '00_tong_quan_va_quan_ly'
    'kehoacjxaydunghoso.md' = '00_tong_quan_va_quan_ly'
    'danh_muc_phan_loai_du_kien.md' = '00_tong_quan_va_quan_ly'

    'tam_nhin_va_muc_tieu_san_pham.md' = '01_san_pham'
    'pham_vi_va_nang_luc_san_pham.md' = '01_san_pham'
    'danh_sach_tinh_nang_san_pham.md' = '01_san_pham'
    'lo_trinh_san_pham.md' = '01_san_pham'

    'so_do_dieu_huong_ung_dung.md' = '02_ux_ui'
    'danh_muc_man_hinh.md' = '02_ux_ui'
    'dac_ta_ux_ui_man_hinh.md' = '02_ux_ui'
    'luong_nguoi_dung.md' = '02_ux_ui'
    'quy_chuan_ux_ui.md' = '02_ux_ui'

    'quy_tac_nghiep_vu.md' = '03_quy_tac_nghiep_vu'
    'so_do_trang_thai_he_thong.md' = '03_quy_tac_nghiep_vu'
    'quy_tac_chuyen_trang_thai.md' = '03_quy_tac_nghiep_vu'
    'quy_tac_du_lieu_va_nghiep_vu.md' = '03_quy_tac_nghiep_vu'
    'danh_muc_quy_tac_va_trang_thai.md' = '03_quy_tac_nghiep_vu'

    'kien_truc_tong_the.md' = '04_kien_truc_ky_thuat'
    'kien_truc_ung_dung.md' = '04_kien_truc_ky_thuat'
    'dac_ta_ky_thuat.md' = '04_kien_truc_ky_thuat'
    'luong_du_lieu_va_tuong_tac_he_thong.md' = '04_kien_truc_ky_thuat'
    'danh_muc_kien_truc_va_thanh_phan.md' = '04_kien_truc_ky_thuat'

    'so_do_co_so_du_lieu.md' = '05_co_so_du_lieu'
    'danh_muc_du_lieu.md' = '05_co_so_du_lieu'
    'hop_dong_du_lieu.md' = '05_co_so_du_lieu'
    'quy_tac_truy_van_va_chi_phi.md' = '05_co_so_du_lieu'
    'danh_muc_duong_dan_du_lieu.md' = '05_co_so_du_lieu'

    'mo_hinh_bao_mat.md' = '06_bao_mat_phan_quyen'
    'danh_muc_vai_tro_va_quyen.md' = '06_bao_mat_phan_quyen'
    'ma_tran_phan_quyen.md' = '06_bao_mat_phan_quyen'
    'quy_tac_xac_thuc_va_truy_cap.md' = '06_bao_mat_phan_quyen'
    'danh_muc_bao_mat_va_kiem_soat.md' = '06_bao_mat_phan_quyen'

    'chien_luoc_kiem_thu.md' = '07_kiem_thu_nghiem_thu'
    'danh_muc_ca_kiem_thu.md' = '07_kiem_thu_nghiem_thu'
    'bo_tieu_chi_nghiem_thu_po.md' = '07_kiem_thu_nghiem_thu'
    'quy_trinh_kiem_thu_va_nghiem_thu.md' = '07_kiem_thu_nghiem_thu'
    'danh_muc_bang_chung_kiem_thu.md' = '07_kiem_thu_nghiem_thu'
    'danh_muc_bang_chung.md' = '07_kiem_thu_nghiem_thu'

    'ma_tran_truy_xuat_tinh_nang.md' = '08_traceability'
    'ma_tran_truy_xuat_yeu_cau.md' = '08_traceability'
    'ban_do_truy_xuat_end_to_end.md' = '08_traceability'
    'bao_cao_do_phu_truy_xuat.md' = '08_traceability'

    'danh_muc_work_item.md' = '09_ke_hoach_thuc_thi'
    'ke_hoach_thuc_hien.md' = '09_ke_hoach_thuc_thi'
    'ban_do_phu_thuoc_work_item.md' = '09_ke_hoach_thuc_thi'
    'dinh_nghia_hoan_thanh.md' = '09_ke_hoach_thuc_thi'
    'roadmap_thuc_thi_du_an.md' = '09_ke_hoach_thuc_thi'
    'ke_hoach_thuc_hi_tong_the.md' = '09_ke_hoach_thuc_thi'

    'bang_theo_doi_tien_do.md' = '10_quan_ly_tien_do'

    'nhat_ky_du_an.md' = '11_nhat_ky_du_an'

    'danh_muc_loi_va_su_co.md' = '12_quan_ly_loi_va_su_co'

    'danh_muc_thay_doi.md' = '13_quan_ly_thay_doi'

    'cac_mau_thuan_can_po_quyet_dinh.md' = '14_rui_ro_va_quyet_dinh'
    'cac_khoang_trong_kien_truc_can_xac_minh.md' = '14_rui_ro_va_quyet_dinh'
    'cac_mau_thuan_du_lieu_can_po_quyet_dinh.md' = '14_rui_ro_va_quyet_dinh'
    'cac_mau_thuan_bao_mat_can_po_quyet_dinh.md' = '14_rui_ro_va_quyet_dinh'
    'cac_mau_thuan_kiem_thu_can_po_quyet_dinh.md' = '14_rui_ro_va_quyet_dinh'
    'cac_mau_thuan_truy_xuat_can_po_quyet_dinh.md' = '14_rui_ro_va_quyet_dinh'
    'danh_muc_rui_ro.md' = '14_rui_ro_va_quyet_dinh'
    'danh_muc_quyet_dinh.md' = '14_rui_ro_va_quyet_dinh'
    'danh_sach_viec_can_po_quyet_dinh.md' = '14_rui_ro_va_quyet_dinh'

    'quy_trinh_build_va_phat_hanh.md' = '15_release_van_hanh'
    'quan_ly_moi_truong.md' = '15_release_van_hanh'
    'kiem_tra_truoc_phat_hanh.md' = '15_release_van_hanh'
    'van_hanh_he_thong.md' = '15_release_van_hanh'
    'quy_trinh_xu_ly_su_co.md' = '15_release_van_hanh'
    'danh_muc_release_va_van_hanh.md' = '15_release_van_hanh'

    'bao_cao_audit_toan_bo_ho_so.md' = '16_audit'
    'danh_muc_thieu_sot_ho_so.md' = '16_audit'
    'danh_muc_mau_thuan_ho_so.md' = '16_audit'
    'bao_cao_tinh_nhat_quan.md' = '16_audit'
    'bao_cao_traceability_audit.md' = '16_audit'

    'bo_ho_so_du_an_fnb_smart_v5_1_baseline.md' = '17_baseline'
    'tong_ban_do_he_thong_fnb_smart_v5_1.md' = '17_baseline'
    'chuoi_truy_xuat_day_du_du_an.md' = '17_baseline'
    'danh_sach_gap_va_quyet_dinh_con_lai.md' = '17_baseline'
    'trang_thai_baseline_du_an.md' = '17_baseline'
    'quy_trinh_quan_ly_baseline.md' = '17_baseline'
    'bao_cao_review_baseline.md' = '17_baseline'
    'danh_sach_noi_dung_po_can_xem.md' = '17_baseline'
    'phieu_quyet_dinh_po_baseline.md' = '17_baseline'
    'bien_ban_review_baseline.md' = '17_baseline'
}

$moved = 0
foreach ($file in $mapping.Keys) {
    $src = Join-Path $root $file
    if (Test-Path $src) {
        $destDir = Join-Path $root $mapping[$file]
        $dest = Join-Path $destDir $file
        Move-Item -Path $src -Destination $dest -Force
        $script:moved++
    }
}
Write-Host "Moved files count: $moved"

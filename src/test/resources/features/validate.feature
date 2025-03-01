Feature: Running integration tests for validate module

Scenario Outline: Execute validate command for tests below.
    Given a test <testName> at dir <testDir> at resource <resourceDir> sending report to <reportDir> with <commandArgs> as arguments
    When with test property count <messageCount> text <messageText> problem <problemEnum> reference <refOutputValue>
    When execute a validate command
    Then produced output from validate command should be similiar to reference <refOutputValue> or no error reported.

  Examples:
 | testName     | testDir | messageCount | messageText | problemEnum | resourceDir | reportDir | commandArgs | refOutputValue | 

# Validate#531
|"NASA-PDS/validate#531 Success Binary Field Group Lengths" | "github531" | 0 | "0 errors expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github531_1.json -s json -t {resourceDir}/github531/success/b.xml" | "report_github531_1.json" |
|"NASA-PDS/validate#531 Fail Binary Field Group Lengths" | "github531" | 1 | "1 errors expected" | "TABLE_DEFINITION_PROBLEM" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github531_2.json -s json -t {resourceDir}/github531/fail/b.xml" | "report_github531_2.json" |

# Validate#529
|"NASA-PDS/validate#529 Success Update Compare Scale" | "github529" | 0 | "0 errors expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github529_1.json -s json -t {resourceDir}/github529/success/m0154651923f6_2p_cif_gbl.xml " | "report_github529_1.json" |
# fixed: |"NASA-PDS/validate#529 Fail Update Compare Scale" | "github529" | 1 | "1 errors expected" | "ARRAY_VALUE_OUT_OF_MIN_MAX_RANGE" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github529_2.json -s json -t {resourceDir}/github529/fail/m0126360726f4_2p_cif_gbl.xml " | "report_github529_2.json" |

# Validate#499
|"NASA-PDS/validate#499 Success Table EOL" | "github499" | 0 | "0 errors expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github499_1.json -s json -t {resourceDir}/github499/success/M7_217_044546_N.xml" | "report_github499_1.json" |
|"NASA-PDS/validate#499 Fail Table EOL" | "github499" | 25 | "25 errors expected" | "MISSING_CRLF" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github499_2.json -s json -t {resourceDir}/github499/fail/M7_217_044546_N.xml" | "report_github499_2.json" |

# Validate#480
|"NASA-PDS/validate#480 Success Intermingled Data Objects" | "github480" | 0 | "0 errors expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github480_1.json -s json -t {resourceDir}/github480/test_success.xml --skip-content-validation" | "report_github480_1.json" |
|"NASA-PDS/validate#480 Fail Intermingled Data Objects - Header Offset" | "github480" | 1 | "1 errors expected" | "INVALID_OBJECT_DEFINITION" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github480_2.json -s json -t {resourceDir}/github480/test_fail_header_offset.xml --skip-content-validation" | "report_github480_2.json" |
|"NASA-PDS/validate#480 Fail Intermingled Data Objects - Table Offset" | "github480" | 1 | "1 errors expected" | "INVALID_OBJECT_DEFINITION" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github480_3.json -s json -t {resourceDir}/github480/test_fail_table_offset.xml --skip-content-validation" | "report_github480_3.json" |

# Validate#444 pds4.bundle option seems to not travel through enough subdirectories
|"NASA-PDS/validate#444 Bundle with Multi-level Collections" | "github444" | 0 | "0 errors expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github444_1.json -s json -t {resourceDir}/github444/odya_bundle/bundle_ody_accel.xml" | "report_github444_1.json" |

# Validate#482 Add support for LBLX label extension. Skipping product validation to avoid known errors in truncated data file.
|"NASA-PDS/validate#533 Failure Test Labels - Records > Integer.MAX " | "github533" | 0 | "0 errors expected" | "totalErrors" | "src/test/resources" | "target/test" | "--skip-content-validation -r {reportDir}/report_github533_1.json -s json -t {resourceDir}/github533/gggrx_1200a_shb_l420.xml" | "report_github533_1.json" |

# Validate#482 Add support for LBLX label extension
|"NASA-PDS/validate#482 Success Test Labels - LBLX Extension" | "github482" | 0 | "Successful validation expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github482_1.json -s json -e lblx -R pds4.folder -t {resourceDir}/github482/bundle1/" | "report_github482_1.json" |
|"NASA-PDS/validate#482 Success Test Labels - XML Extension " | "github482" | 0 | "Successful validation expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github482_2.json -s json -R pds4.folder -t {resourceDir}/github482/bundle2/" | "report_github482_2.json" |
|"NASA-PDS/validate#482 Success Test Bundle - LBLX Extension" | "github482" | 0 | "Successful validation expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github482_3.json -s json -R pds4.bundle -e lblx -t {resourceDir}/github482/bundle1/bundle_kaguya_derived.lblx" | "report_github482_3.json" |
|"NASA-PDS/validate#482 Success Test Bundle - XML Extension " | "github482" | 0 | "Successful validation expected" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github482_4.json -s json -R pds4.bundle -t {resourceDir}/github482/bundle2/bundle_kaguya_derived.xml" | "report_github482_4.json" |
|"NASA-PDS/validate#482 Failure Test Bundle - No Products Found" | "github482" | 1 | "1 error expected" | "NO_PRODUCTS_FOUND" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github482_5.json -s json -R pds4.folder -t {resourceDir}/github482/bundle1/" | "report_github482_5.json" |
|"NASA-PDS/validate#482 Failure Test Bundle - No Products Found" | "github482" | 1 | "1 error expected" | "NO_PRODUCTS_FOUND" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github482_6.json -s json -R pds4.folder -e lblx -t {resourceDir}/github482/bundle2/" | "report_github482_6.json" |

# Field Special Constants
 |"NASA-PDS/validate#469 Field Special Constants Check" | "github469" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github469.json -s json -t {resourceDir}/github469/201401031400_rdr.xml" | "report_github469.json" |
 |"NASA-PDS/validate#469 Field Special Constants Check - Fail MAX" | "github469" | 1 | "1 error messages expected." | "FIELD_VALUE_OUT_OF_MIN_MAX_RANGE" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github469_max_fail.json -s json -t {resourceDir}/github469/201401031400_rdr_max_FAIL.xml" | "report_github469_max_fail.json" |
 |"NASA-PDS/validate#469 Field Special Constants Check - Fail MIN" | "github469" | 3 | "3 error messages expected." | "FIELD_VALUE_OUT_OF_MIN_MAX_RANGE" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github469_min_fail.json -s json -t {resourceDir}/github469/201401031400_rdr_min_FAIL.xml" | "report_github469_min_fail.json" |

 |"NASA-PDS/validate#291 VALID" | "github291" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github291_bundle_valid.json -s json -R pds4.bundle -t {resourceDir}/github291/valid/bundle_kaguya_derived.xml" | "report_github291_bundle_valid.json" |
 |"NASA-PDS/validate#291 INVALID" | "github291" | 1 | "1 warning message expected for BAD_SCHEMATYPENS." | "BAD_SCHEMATYPENS" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github291_bundle_invalid.json -s json -R pds4.bundle -t {resourceDir}/github291/invalid/bundle_kaguya_derived.xml" | "report_github291_bundle_invalid.json" |

# Moved github292 tests to the end as they interfere with other test with the following error message:
#
# The attribute pds:information_model_version must be equal to the value '1.16.0.0'.


 |"NASA-PDS/validate#294 VALID" | "github294" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -r {reportDir}/report_github294_bundle_valid.json -s json -R pds4.label -t {resourceDir}/github294/valid/minmax-error.xml" | "report_github294_bundle_valid.json" |
 |"NASA-PDS/validate#294 INVALID" | "github294" | 1 | "1 error messages expected for RECORDS_MISMATCH." | "RECORDS_MISMATCH" | "src/test/resources" | "target/test" | "--skip-context-validation -r {reportDir}/report_github294_bundle_invalid.json -s json -R pds4.label -t {resourceDir}/github294/invalid/minmax-error.xml" | "report_github294_bundle_invalid.json" |

 |"NASA-PDS/validate#173 1" | "github173" | 0 | "0 error messages expected. See validation report:" | "RECORDS_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github173_1.json -s json -R pds4.bundle -t {resourceDir}/github173/valid/ --skip-content-validation" | "report_github173_1.json" |
 |"NASA-PDS/validate#173 2" | "github173" | 1 | "1 info/error messages not expected." | "RECORDS_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github173_2.json -s json -R pds4.bundle -t {resourceDir}/github173/invalid/ --skip-content-validation" | "report_github173_2.json" |
|"NASA-PDS/validate#149 1" | "github173" | 0 | "0 error messages expected. See validation report: " | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github149_1.json -s json -t {resourceDir}/github173/valid/bundle_kaguya_derived.xml" | "report_github149_1.json" |
# "The attribute pds:information_model_version must be equal to the value '1.7.0.0'."}]
# {pds-dev3.jpl.nasa.gov}/home/qchau/sandbox/validate 168 % grep -n information_model_version ./src/test/resources/github173/invalid/bundle_kaguya_derived.xml
#11:        <information_model_version>1.11.0.0</information_model_version>
 |"NASA-PDS/validate#149 2" | "github173" | 0 | "0 error messages expected. See validation report: " | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github149_2.json -s json -t {resourceDir}/github173/invalid/bundle_kaguya_derived.xml" | "report_github149_2.json" |

 |"NASA-PDS/validate#5 1" | "github5" | 6 | "6 FILE_NAME_HAS_INVALID_CHARS,UNALLOWED_BASE_NAME messages expected." | "FILE_NAME_HAS_INVALID_CHARS,UNALLOWED_BASE_NAME" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github5_bundle_invalid.json -s json -t {resourceDir}/github5/invalid/bundle_kaguya_derived.xml" | "report_github5_bundle_invalid.json" |
 |"NASA-PDS/validate#5 2" | "github5" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github5_bundle_valid.json -s json -t {resourceDir}/github5/valid/bundle_kaguya_derived.xml" | "report_github5_bundle_valid.json" |
 |"NASA-PDS/validate#11 1" | "github11" | 1 | "1 INVALID_OBJECT_DEFINITION messages expected." | "INVALID_OBJECT_DEFINITION" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github11_invalid_1.json -s json -t {resourceDir}/github11/test_data/science_index_bad_1.xml" | "report_github11_invalid_1.json" |
 |"NASA-PDS/validate#11 2" | "github11" | 1 | "1 INVALID_OBJECT_DEFINITION messages expected." | "INVALID_OBJECT_DEFINITION" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github11_invalid_2.json -s json -t {resourceDir}/github11/test_data/science_index_bad_2.xml" | "report_github11_invalid_2.json" |
 |"NASA-PDS/validate#11 3" | "github11" | 0 | "0 INVALID_OBJECT_DEFINITION messages expected." | "INVALID_OBJECT_DEFINITION" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github11_valid.json -s json -t {resourceDir}/github11/test_data/science_index_good.xml" | "report_github11_valid.json" |
# The number of errors increase from 1 to 2 due to https://github.com/NASA-PDS/validate/issues/374 Refactor PDF/A check handling to match with similar product checks 
# The function validateFileStandardConformity() in PDFUtil cannot build the URI from a URL that contains spaces.
# So, the 1st error is the file name contains spaces from FileAndDirectoryNamingRule and the 2nd error comes from function validateFileStandardConformity().
 |"NASA-PDS/validate#153 1" | "github153" | 2 | "2 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -R pds4.label -r {reportDir}/report_github153_invalid.json -s json -t {resourceDir}/github153/iue_asteroid_spectra/document/3juno_lwr01896_ines_fits_headers.pdfa%.xml" | "report_github153_invalid.json" |
 |"NASA-PDS/validate#153 2" | "github153" | 0 | "No error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -R pds4.label -r {reportDir}/report_github153_valid.json -s json -t {resourceDir}/github153/iue_asteroid_spectra/document/collection_iue_asteroid_spectra_document.xml" | "report_github153_valid.json" |
 |"NASA-PDS/validate#17 1" | "github17" | 2 | "2 warning expected." | "totalWarnings" | "src/test/resources" | "target/test" | "--skip-context-validation -R pds4.label -r {reportDir}/report_github17_invalid.json -s json -t {resourceDir}/github17/delimited_table_bad.xml" | "report_github17_invalid.json" |
 |"NASA-PDS/validate#17 2" | "github17" | 0 | "No error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -R pds4.label -r {reportDir}/report_github17_valid.json -s json -t {resourceDir}/github17/delimited_table_good.xml" | "report_github17_valid.json" |

 |"NASA-PDS/validate#230 1" | "github230" | 2 | "2 errors expected for MISSING_VERSION." | "MISSING_VERSION" | "src/test/resources" | "target/test" | "--skip-content-validation -R pds4.bundle -r {reportDir}/report_github230_invalid.json -s json -t {resourceDir}/github230/invalid/cocirs_c2h4abund/bundle_cocirs_c2h4abund.xml" | "report_github230_invalid.json" |
 |"NASA-PDS/validate#230 2" | "github230" | 0 | "0 errors expected for MISSING_VERSION." | "MISSING_VERSION" | "src/test/resources" | "target/test" | "--skip-content-validation -R pds4.bundle -r {reportDir}/report_github230_valid.json -s json -t {resourceDir}/github230/valid/cocirs_c2h4abund/bundle_cocirs_c2h4abund.xml" | "report_github230_valid.json" |

 |"NASA-PDS/validate#51 1" | "github51" | 0 | "0 errors expected for totalErrors." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-content-validation --skip-context-validation -r {reportDir}/report_github51_1.json -s json -t {resourceDir}/github51/valid" | "report_github51_1.json" |
# Previous 2 info.validation.general plus 5 new ones from warning messages from code changes in https://github.com/NASA-PDS/validate/issues/308
# Per https://github.com/NASA-PDS/validate/issues/368 will change 7 back to 2.
#
 |"NASA-PDS/validate#51 2" | "github51" | 2 | "2 errors expected for GENERAL_INFO." | "GENERAL_INFO" | "src/test/resources" | "target/test" | "-R pds4.bundle --alternate_file_paths src/test/resources/github51_additionals/additional_dir1/data_spectra,src/test/resources/github51_additionals/additional_dir2/data_spectra --skip-product-validation --skip-content-validation -r {reportDir}/report_github51_2.json -s json -t {resourceDir}/github51/valid" | "report_github51_2.json" |
#
 |"NASA-PDS/validate#6 1" | "github6" | 7 | "7 errors expected for FILE_NAME_HAS_INVALID_CHARS,UNALLOWED_BASE_NAME,UNALLOWED_FILE_NAME,DIR_NAME_HAS_INVALID_CHARS." | "FILE_NAME_HAS_INVALID_CHARS,UNALLOWED_BASE_NAME,UNALLOWED_FILE_NAME,DIR_NAME_HAS_INVALID_CHARS" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github6_bundle_invalid_cucumber.json -s json {resourceDir}/github6/invalid/bundle_kaguya_derived.xml" | "report_github6_bundle_invalid_cucumber.json" |
 |"NASA-PDS/validate#6 2" | "github6" | 0 | "0 errors expected for totalErrors." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github6_bundle_valid_cucumber.json -s json {resourceDir}/github6/valid/bundle_kaguya_derived.xml" | "report_github6_bundle_valid_cucumber.json" |
 |"NASA-PDS/validate#240 1" | "github240" | 0 | "0 errors expected for totalErrors." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github240_bundle_valid_cucumber.json -s json {resourceDir}/github240/valid/bundle_kaguya_derived.xml" | "report_github240_bundle_valid_cucumber.json" |
 |"NASA-PDS/validate#240 2" | "github240" | 3 | "3 warnings expected for UNALLOWED_BUNDLE_SUBDIR_NAME." | "UNALLOWED_BUNDLE_SUBDIR_NAME" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github240_bundle_invalid_cucumber.json -s json {resourceDir}/github240/invalid/bundle_kaguya_derived.xml" | "report_github240_bundle_invalid_cucumber.json" |

# https://github.com/NASA-PDS/validate/issues/15 Verify that all name/type attribute values correspond to names denoted context products

 |"NASA-PDS/validate#15 1" | "github15" | 0 | "0 valid context references should be found" | "CONTEXT_REFERENCE_NOT_FOUND" | "src/test/resources" | "target/test" | "-v1 -r {reportDir}/report_github15_pass.json -s json -R pds4.label -t {resourceDir}/github15/test_check-pass_context_products.xml" | "report_github15_pass.json" |
 |"NASA-PDS/validate#15 2" | "github15" | 4 | "4 errors expected for invalid context reference (Lid, name, value) test." | "CONTEXT_REFERENCE_NOT_FOUND,CONTEXT_REFERENCE_FOUND_MISMATCH" | "src/test/resources" | "target/test" | "-v1 -r {reportDir}/report_github15_no-pass.json -s json {resourceDir}/github15/test_check-no-pass_context_products.xml" | "report_github15_no-pass.json" |

# The below tests are for real.

 |"NASA-PDS/validate#28 1" | "github28" | 1 | "1 error expected for invalid context reference test." | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github28_1.json -s json {resourceDir}/github28/test_add_context_products.xml" | "report_github28_1.json" |
 |"NASA-PDS/validate#28 2" | "github28" | 0 | "No errors expected for add additional context test" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github28_2.json -s json --add-context-products {resourceDir}/github28/new_context.json -t {resourceDir}/github28/test_add_context_products.xml" | "report_github28_2.json" |

 |"NASA-PDS/validate#137 1" | "github137" | 0 | "FIELD_VALUE_DATA_TYPE_MISMATCH info/error messages expected." | "FIELD_VALUE_DATA_TYPE_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github137_1.json -s json -t {resourceDir}/github137/delimited_table_good.xml" | "report_github137_1.json" |
 |"NASA-PDS/validate#137 1" | "github137" | 2 | "FIELD_VALUE_DATA_TYPE_MISMATCH info/error messages not expected." | "FIELD_VALUE_DATA_TYPE_MISMATCH" |  "src/test/resources" | "target/test" | "-r {reportDir}/report_github137_2.json -s json -t {resourceDir}/github137/delimited_table_bad.xml" | "report_github137_2.json" |

## Note that the reference code re-use the JSON report file for both tests but we won't
 |"NASA-PDS/validate#47 1" | "github47" | 0 | "No errors expected. Context validation disabled" | "CONTEXT_REFERENCE_NOT_FOUND" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github47_disable-valid.json -s json -R pds4.label --skip-content-validation --skip-context-validation {resourceDir}/github47/test_context_products.xml" | "report_github47_disable-valid.json" |
 |"NASA-PDS/validate#47 2" | "github47" | 4 | "4 errors expected. Context validation enabled." | "CONTEXT_REFERENCE_NOT_FOUND,CONTEXT_REFERENCE_FOUND_MISMATCH" | "src/test/resources" | "target/test" | "-v1 --skip-content-validation -r {reportDir}/report_github47_enable-valid.json -s json -R pds4.label {resourceDir}/github47/test_context_products.xml" | "report_github47_enable-valid.json" |

 |"NASA-PDS/validate#62 1"   | "github62" | 4 | "4 info.label.context_ref_found info messages expected.\n" | "CONTEXT_REFERENCE_FOUND" | "src/test/resources" | "target/test" | "-v1 -r {reportDir}/report_github62_1.json -s json --no-data-check -t {resourceDir}/github62/ele_mom_tblChar.xml"  | "report_github62_1.json" |
 |"NASA-PDS/validate#62 2" | "github62" | 8 | "8 info/error messages expected.\n" | "CONTEXT_REFERENCE_FOUND,CONTEXT_REFERENCE_NOT_FOUND" |  "src/test/resources" | "target/test" | "-v1 -r {reportDir}/report_github62_2.json -s json --no-data-check -t {resourceDir}/github62/spacecraft.orex_1.1.xml"  | "report_github62_2.json" |

# Move github278 before github71 as it causing issues
 |"NASA-PDS/validate#278 1" | "github278" | 1 | "1 errors expected for CONTEXT_REFERENCE_NOT_FOUND." | "CONTEXT_REFERENCE_NOT_FOUND" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github278_label_invalid_cucumber.json -s json {resourceDir}/github278/invalid/trk-2-34-revn-l5_tnf_invalid.xml" | "report_github278_label_invalid_cucumber.json" |
 |"NASA-PDS/validate#278 2" | "github278" | 0 | "0 errors expected for CONTEXT_REFERENCE_NOT_FOUND." | "CONTEXT_REFERENCE_NOT_FOUND" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github278_label_valid_cucumber.json -s json {resourceDir}/github278/valid/trk-2-34-revn-l5_tnf.xml" | "report_github278_label_valid_cucumber.json" |

 |"NASA-PDS/validate#9 1" | "github09" | 0 | "info/error messages expected." | "FIELD_VALUE_DATA_TYPE_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github09_1.json -s json -t {resourceDir}/github09/minimal_test_product_good2.xml" | "report_github09_1.json" |
 |"NASA-PDS/validate#9 2" | "github09" | 0 | "0 info/error messages not expected." | "FIELD_VALUE_DATA_TYPE_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github09_2.json -s json -t {resourceDir}/github09/minimal_test_product_good.xml" | "report_github09_2.json" |
 |"NASA-PDS/validate#9 3" | "github09" | 0 | "0 info/error messages not expected" | "FIELD_VALUE_DATA_TYPE_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github09_3.json -s json -t {resourceDir}/github09/csv_empty_field_test_VALID.xml" | "report_github09_3.json" |
 |"NASA-PDS/validate#9 4" | "github09" | 1 | "1 info/error messages expected." | "FIELD_VALUE_DATA_TYPE_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github09_4.json -s json -t {resourceDir}/github09/csv_empty_field_test_INVALID.xml" | "report_github09_4.json" |
 |"NASA-PDS/validate#9 5" | "github09" | 0 | "0 info/error messages expected." | "FIELD_VALUE_DATA_TYPE_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github09_5.json -s json -t {resourceDir}/github09/val9a.xml.xml" | "report_github09_5.json" |
 |"NASA-PDS/validate#9 6" | "github09" | 1 | "1 info/error messages expected." | "FIELD_VALUE_DATA_TYPE_MISMATCH" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github09_6.json -s json -t {resourceDir}/github09/val9b.xml" | "report_github09_6.json" |

 |"NASA-PDS/validate#50 1" | "github50" | 0 | "0 error messages expected.\n" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github50_1.json -s json --skip-content-validation --target-manifest {reportDir}/target-manifest.xml" | "report_github50_1.json" |
 |"NASA-PDS/validate#50 2" | "github50" | 3 | "3 error messages expected.\n" | "MISSING_REFERENCED_FILE" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github50_2.json -s json --target-manifest {reportDir}/target-manifest.xml  -t {resourceDir}/github50/ele_evt_8hr_orbit_2014-2015.xml" | "report_github50_2.json" |
## Very special note: Test github84 must be specified after github71 and github71_2 due to dependency.
## That means if github84 is included in this table, github71 and github71_2 MUST also be included,
## otherwise you will see errors and not know why.
# |"NASA-PDS/validate#84 1" | "github84" | 0 | "No error messages expected" | "summary_message_only" |  "src/test/resources" | "target/test" |  "-r {reportDir}/report_github84_1.json -s json --no-data-check -c {resourceDir}/github84/config.txt -t {resourceDir}/github71/ELE_MOM.xml" | "report_github84_1.json" |
# Remove duplicate test: "NASA-PDS/validate#87 1"

# Remove duplicate tests: "NASA-PDS/validate#137 1" and "NASA-PDS/validate#137 2"

# BIG_NOTE: The tests for github173 has to be moved toward the beginning as leave them here results in error in information model.

# Note: Test github149 depends on github173 so if both have to be included and test github173 should be ran first.
# Something weird with the below test.  If included everything above and then added this test, it failed.
# "The attribute pds:information_model_version must be equal to the value '1.7.0.0'."}],
# {pds-dev3.jpl.nasa.gov}/home/qchau/sandbox/validate 167 % grep -n information_model_version ./src/test/resources/github173/valid/bundle_kaguya_derived.xml
#11:        <information_model_version>1.11.0.0</information_model_version>
# BIG_NOTE: The tests for github149 has to be moved toward the beginning as leave them here results in error in information model.
#

# The 3 tests below are from "github209"
# There should be no WARN message for VALID test.
 |"NASA-PDS/validate#209 VALID" | "github209" | 0 | "0 WARN message(s) expected. See validation report:" | "totalWarnings" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github209_1.json -s json  -t {resourceDir}/github209/VALID_odf07155_msgr_11.xml" | "report_github209_1.json" |
# For some reason, when ran, the actual number is 4 instead of 1.
# [{"severity":"ERROR","type":"error.table.field_value_overlap","table":12,"record":1,"field":5,"message":"The bit field overlaps the next field. Current stop_bit_location: 23. Next start_bit_location: 20"}]}]}],"summary":{"totalErrors":4,
 |"NASA-PDS/validate#209 FAIL1" | "github209" | 1 | "1 message(s) expected. See validation report:" | "FIELD_VALUE_OVERLAP" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github209_2.json -s json  -t {resourceDir}/github209/FAIL1_overlapping_bit_fields.xml" | "report_github209_2.json" |
# ,{"severity":"ERROR","type":"error.table.bad_field_read","table":12,"record":1,"field":6,"message":"Error while getting field value: Stop bit past end of packed field (32 > 31)"}]}]}],"summary":{"totalErrors":5,
 |"NASA-PDS/validate#209 FAIL2" | "github209" | 2 | "2 message(s) expected. See validation report:" | "FIELD_VALUE_OVERLAP,BAD_FIELD_READ" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github209_3.json -s json  -t {resourceDir}/github209/FAIL2_bad_stop_bit.xml" | "report_github209_3.json" |
#
#
# The correct location of file catalog.xml is in {reportDir} and not {resourceDir}
# Move github87 as it is interfering with github292 tests

# https://github.com/NASA-PDS/validate/issues/281 Validate fails to report error in File.file_size

 |"NASA-PDS/validate#281 1" | "github281" | 1 | "1 errors expected for FILESIZE_MISMATCH." | "FILESIZE_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github281_label_invalid_1_cucumber.json -s json {resourceDir}/github281/invalid/collection_gwe_spk_invalid_1_bad_filesize.xml" | "report_github281_label_invalid_1_cucumber.json" |
 |"NASA-PDS/validate#281 2" | "github281" | 1 | "1 errors expected for CHECKSUM_MISMATCH." | "CHECKSUM_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github281_label_invalid_2_cucumber.json -s json {resourceDir}/github281/invalid/collection_gwe_spk_invalid_2_bad_checksum.xml" | "report_github281_label_invalid_2_cucumber.json" |
 |"NASA-PDS/validate#281 3" | "github281" | 1 | "1 errors expected for CHECKSUM_MISMATCH." | "CHECKSUM_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github281_label_invalid_3_cucumber.json -s json {resourceDir}/github281/invalid/collection_gwe_spk_invalid_3_bad_checksum_no_filesize.xml" | "report_github281_label_invalid_3_cucumber.json" |
 |"NASA-PDS/validate#281 4" | "github281" | 0 | "0 errors expected for FILESIZE_MISMATCH." | "FILESIZE_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github281_label_valid_1_cucumber.json -s json {resourceDir}/github281/valid/collection_gwe_spk_valid_1.xml" | "report_github281_label_valid_1_cucumber.json" |
 |"NASA-PDS/validate#281 5" | "github281" | 0 | "0 errors expected for FILESIZE_MISMATCH." | "FILESIZE_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github281_label_valid_2_cucumber.json -s json {resourceDir}/github281/valid/collection_gwe_spk_valid_2_no_filesize.xml" | "report_github281_label_valid_2_cucumber.json" |
 |"NASA-PDS/validate#281 6" | "github281" | 0 | "0 errors expected for FILESIZE_MISMATCH." | "FILESIZE_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github281_label_valid_3_cucumber.json -s json {resourceDir}/github281/valid/collection_gwe_spk_valid_3_no_filesize_no_checksum.xml" | "report_github281_label_valid_3_cucumber.json" |

# https://github.com/NASA-PDS/validate/issues/298 validate misses double quotes within a delimited table

 |"NASA-PDS/validate#298 VALID" | "github298" | 0 | "0 errors messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github298_label_valid.json -s json {resourceDir}/github298/valid/sentences.xml" | "report_github298_label_valid.json" |
 |"NASA-PDS/validate#298 INVALID" | "github298" | 43 | "43 errors expected for INVALID_FIELD_VALUE ." | "INVALID_FIELD_VALUE" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github298_label_invalid.json -s json {resourceDir}/github298/invalid/sentences.xml" | "report_github298_label_invalid.json" |

# https://github.com/NASA-PDS/validate/issues/188 As a user, I want to validate a bundle that uses multiple versions of the Information Model / Discipline LDDs
 |"NASA-PDS/validate#188 VALID" | "github188" | 0 | "0 errors message expected" | "totalErrors" | "src/test/resources" | "target/test" | "--skip-content-validation -r {reportDir}/report_github188_label_valid_both.json  -s json -t {resourceDir}/github188/bundle_cassini-huygens-coradar.xml {resourceDir}/github188/BILQH07S314_D065_T008S02_V02_without_Missing_Area_tag.xml" | "report_github188_label_valid_both.json" |

# https://github.com/NASA-PDS/validate/issues/210 As a user, I want validate to raise a WARNING when differing versions of IM are used within a bundle
 |"NASA-PDS/validate#210 WITH_WARNING" | "github210" | 1 | "1 warning message expected" | "totalWarnings" | "src/test/resources" | "target/test" | "--skip-content-validation -r {reportDir}/report_github210_label_valid_both_with_warning.json  -s json -t {resourceDir}/github210/bundle_cassini-huygens-coradar.xml {resourceDir}/github210/BILQH07S314_D065_T008S02_V02_without_Missing_Area_tag.xml" | "report_github210_label_valid_both_with_warning.json" |

# https://github.com/NASA-PDS/validate/issues/310 Validate missing collections in bundle after CCB-282 updates
 |"NASA-PDS/validate#310 WITHOUT_WARNING" | "github310" | 0 | "0 UNREFERENCED_MEMBER warning message expected" | "UNREFERENCED_MEMBER" | "src/test/resources" | "target/test" | "-R pds4.bundle --skip-content-validation -r {reportDir}/report_github310_bundle_valid.json  -s json -t {resourceDir}/github310/valid/bundle.xml" | "report_github310_bundle_valid.json" |
 |"NASA-PDS/validate#310 WITH_WARNING" | "github310" | 2 | "2 UNREFERENCED_MEMBER warning message expected" | "UNREFERENCED_MEMBER" | "src/test/resources" | "target/test" | "-R pds4.bundle --skip-content-validation -r {reportDir}/report_github310_bundle_invalid.json  -s json -t {resourceDir}/github310/invalid/bundle.xml" | "report_github310_bundle_invalid.json" |

# https://github.com/NASA-PDS/validate/issues/57 As a user, I want to be warned when there are alphanumeric characters between fields in Table_Character
 |"NASA-PDS/validate#57 WITH_WARNING" | "github57" | 5 | "5 warning messages expected" | "totalWarnings" | "src/test/resources" | "target/test" | "-R pds4.label --strict-field-checks --skip-context-validation -r {reportDir}/report_github57_label_valid_with_warning.json  -s json -t {resourceDir}/github57/validate_57a_valid.xml" | "report_github57_label_valid_with_warning.json" |
 |"NASA-PDS/validate#57 WITHOUT_WARNING" | "github57" | 0 | "0 warning messages expected" | "totalWarnings" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github57_label_valid_without_warning.json  -s json -t {resourceDir}/github57/validate_57a_valid.xml" | "report_github57_label_valid_without_warning.json" |
 |"NASA-PDS/validate#57 INVALID" | "github57" | 4 | "4 error messages expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --strict-field-checks --skip-context-validation -r {reportDir}/report_github57_label_invalid.json  -s json -t {resourceDir}/github57/validate_57a_invalid.xml" | "report_github57_label_invalid.json" |

# https://github.com/NASA-PDS/validate/issues/303 As a user, I want to the raise a WARNING if the object-defined size in the label does not match the file_size value

 |"NASA-PDS/validate#303 INVALID" | "github303" | 1 | "1 error messages expected" | "ARRAY_DATA_FILE_READ_ERROR" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github303_label_invalid.json  -s json -t {resourceDir}/github303/invalid/I52_20210207_1A_U1B03A_01_0001.avgs.xml" | "report_github303_label_invalid.json" |
 |"NASA-PDS/validate#303 VALID" | "github303" | 0 | "0 error messages expected" | "ARRAY_DATA_FILE_READ_ERROR" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github303_label_valid.json  -s json -t {resourceDir}/github303/valid/I52_20210207_1A_U1B03A_01_0001.avgs.xml" | "report_github303_label_valid.json" |

# https://github.com/NASA-PDS/validate/issues/164 As a user, I want to validate PDF files are PDF/A
 |"NASA-PDS/validate#164 WITH_ERROR" | "github164" | 1 | "1 error messages expected" | "NON_PDFA_FILE" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github164_label_pdfa_invalid.json  -s json -t {resourceDir}/github164/invalid/document_test_1_pdf.xml" | "report_github164_label_pdfa_invalid.json" |
 |"NASA-PDS/validate#164 VALID" | "github164" | 0 | "0 warning messages expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github164_label_pdfa_valid.json  -s json -t {resourceDir}/github164/valid/document_pdfa_valid.xml" | "report_github164_label_pdfa_valid.json" |

# https://github.com/NASA-PDS/validate/issues/325 Validate Incorrectly Throws Error When Embedded Field_Character Contains <CR><LF>

 |"NASA-PDS/validate#325 VALID" | "github325" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github325_label_valid.json -s json -R pds4.label -t {resourceDir}/github325/crs009x.xml" | "report_github325_label_valid.json" |

# https://github.com/NASA-PDS/validate/issues/335 validate gives a NullPointerException during validation of a directory containing Table_Character products

 |"NASA-PDS/validate#335 VALID_1" | "github335" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -r {reportDir}/report_github335_as_label_valid.json -s json -R pds4.label -t {resourceDir}/github335/minimal_test_product.xml" | "report_github335_as_label_valid.json" |
 |"NASA-PDS/validate#335 VALID_2" | "github335" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -r {reportDir}/report_github335_as_dir_valid.json -s json -t {resourceDir}/github335/" | "report_github335_as_dir_valid.json" | 

# https://github.com/NASA-PDS/validate/issues/328 validate bundle incorrectly reports "not a member of any collection" that it passed before

 |"NASA-PDS/validate#328 VALID" | "github328" | 0 | "0 warning messages expected." | "UNREFERENCED_MEMBER" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github328_bundle_valid.json -s json -t {resourceDir}/github328/valid/bundle_misc.xml" | "report_github328_bundle_valid.json" |
 |"NASA-PDS/validate#328 INVALID" | "github328" | 1 | "1 warning messages expected." | "UNREFERENCED_MEMBER" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github328_bundle_invalid.json -s json -t {resourceDir}/github328/invalid/bundle_misc.xml" | "report_github328_bundle_invalid.json" |

# https://github.com/NASA-PDS/validate/issues/334 validate 2.1.0 snapshot fails on a label with 2 table_character

 |"NASA-PDS/validate#334 VALID" | "github334" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github334_label_valid.json -s json -t {resourceDir}/github334/valid/pvoro_graph_eden_k91_3a_01_v01_r00.xml" | "report_github334_label_valid.json" |
 |"NASA-PDS/validate#334 VALID" | "github334" | 2 | "2 error messages expected." | "INVALID_OBJECT_DEFINITION" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github334_label_invalid.json -s json -t {resourceDir}/github334/invalid/pvoro_graph_eden_k91_3a_01_v01_r00.xml" | "report_github334_label_invalid.json" |


# https://github.com/NASA-PDS/validate/issues/308 As a user, I want to check that all Internal References are valid references to other PDS4 products within the current validating bundle

 |"NASA-PDS/validate#308 VALID" | "github308" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github308_bundle_valid.json -s json -t {resourceDir}/github308/valid/bundle_kaguya_derived.xml" | "report_github308_bundle_valid.json" |
# 2 warning.integrity.unreferenced_member
# 4 info.validation.general
#
 |"NASA-PDS/validate#308 INVALID" | "github308" | 2 | "2 UNREFERENCED_MEMBER warning messages expected." | "UNREFERENCED_MEMBER" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github308_bundle_invalid.json -s json -t {resourceDir}/github308/invalid/bundle_kaguya_derived.xml" | "report_github308_bundle_invalid.json" |

# https://github.com/NASA-PDS/validate/issues/344 validate inexplicably writes to validate_stack_traces.log

 |"NASA-PDS/validate#344 VALID" | "github344" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github344_bundle_valid.json -s json -t {resourceDir}/github344/bundle.xml" | "report_github344_bundle_valid.json" |

# https://github.com/NASA-PDS/validate/issues/345 validate incorrectly flags integers bounded by "" in a .csv

 |"NASA-PDS/validate#345 VALID" | "github345" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github345_label_valid.json -s json -t {resourceDir}/github345/astro_sample_t.xml" | "report_github345_label_valid.json" |
 |"NASA-PDS/validate#345 VALID_2" | "github345" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github345_label_valid_2.json -s json -t {resourceDir}/github345/astro_sample_data_t.xml" | "report_github345_label_valid_2.json" |

# https://github.com/NASA-PDS/validate/issues/355 Improve validate reporting when trying to read a null row
# https://github.com/nasa-pds/validate/issues/357 Validate allows CRLF within a Table_Delimited field
 
 |"NASA-PDS/validate#357 INVALID_1" | "github357" | 2 | "2 error messages expected: 1 error.validation.invalid_field_value and 1 error.table.bad_field_read." | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github357_label_invalid_1.json -s json -t {resourceDir}/github357/whypointsremovedfromdata.xml" | "report_github357_label_invalid_1.json" |
 |"NASA-PDS/validate#357 INVALID_2" | "github357" | 1 | "1 error messages expected: 1 error.validation.invalid_field_value" | "INVALID_FIELD_VALUE" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github357_label_invalid_2.json -s json -t {resourceDir}/github357/whypointsremovedfromdata_2240_records.xml" | "report_github357_label_invalid_2.json" |
 |"NASA-PDS/validate#357 INVALID_3" | "github357" | 1 | "1 error messages expected: 1 error.table.records_mismatch" | "RECORDS_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github357_label_invalid_3.json -s json -t {resourceDir}/github357/whypointsremovedfromdata_2250_records.xml" | "report_github357_label_invalid_3.json" |
 |"NASA-PDS/validate#357 INVALID_4" | "github357" | 1 | "1 error messages expected: 1 error.validation.invalid_field_value." | "INVALID_FIELD_VALUE" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github357_label_invalid_4.json -s json -t {resourceDir}/github357/whypointsremovedfromdata_4_records.xml" | "report_github357_label_invalid_4.json" |

# https://github.com/nasa-pds/validate/issues/356 validate labels error.sub_directory.unallowed_name as a warning 

 |"NASA-PDS/validate#356 VALID" | "github356" | 0 | "0 warning messages expected: 0 warning.sub_directory.unallowed_name (uses github240 input directory)" | "UNALLOWED_BUNDLE_SUBDIR_NAME" | "src/test/resources" | "target/test" | "-R pds4.bundle  --skip-product-validation --skip-context-validation --skip-content-validation -r {reportDir}/report_github356_bundle_valid.json -s json -t {resourceDir}/github240/valid/bundle_kaguya_derived.xml" | "report_github356_bundle_valid.json" |
 |"NASA-PDS/validate#356 INVALID" | "github356" | 3 | "3 warning messages expected: 3 warning.sub_directory.unallowed_name (uses github240 input directory)" | "UNALLOWED_BUNDLE_SUBDIR_NAME" | "src/test/resources" | "target/test" | "-R pds4.bundle  --skip-product-validation --skip-context-validation --skip-content-validation -r {reportDir}/report_github356_bundle_invalid.json -s json -t {resourceDir}/github240/invalid/bundle_kaguya_derived.xml" | "report_github356_bundle_invalid.json" |

# https://github.com/nasa-pds/validate/issues/364 validate does not allow ".XML" as an extension for a label file  

 |"NASA-PDS/validate#364 VALID" | "github364" | 0 | "0 error messages expected: 0 totalErrors" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --skip-product-validation --skip-context-validation --skip-content-validation -r {reportDir}/report_github364_label_valid.json -s json -t {resourceDir}/github364//MIS000XXX_2021001T000000_DEV0_2021001T0000_RAW010.XML" | "report_github364_label_valid.json" |
 |"NASA-PDS/validate#364 INVALID" | "github364" | 1 | "1 error messages expected: 1 error.label.bad_extension" | "BAD_EXTENSION" | "src/test/resources" | "target/test" | "-R pds4.label --skip-product-validation --skip-context-validation --skip-content-validation -r {reportDir}/report_github364_label_invalid.json -s json -t {resourceDir}/github364//MIS000XXX_2021001T000000_DEV0_2021001T0000_RAW010" | "report_github364_label_invalid.json" |

# https://github.com/nasa-pds/validate/issues/343 As a user I want to see the name of a table/array in errors, if one is specified 

 |"NASA-PDS/validate#343 VALID" | "github343" | 0 | "0 error messages expected: 0 totalErrors" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github343_label_valid_1.json -s json -t {resourceDir}/github343/test_data/I52_20210207_1A_U1B03A_01_0001.avgs.xml" | "report_github343_label_valid_1.json" |
 |"NASA-PDS/validate#343 INVALID_1" | "github343" | 14 | "14 error messages expected: 14 ARRAY_VALUE_OUT_OF_MIN_MAX_RANGE with table name" | "ARRAY_VALUE_OUT_OF_MIN_MAX_RANGE" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github343_label_invalid_1.json -s json -t {resourceDir}/github343/test_data/I52_20210207_1A_U1B03A_01_0001.avgs_bad.xml" | "report_github343_label_invalid_1.json" |
 |"NASA-PDS/validate#343 INVALID_2" | "github343" | 14 | "14 error messages expected: 14 ARRAY_VALUE_OUT_OF_MIN_MAX_RANGE without table name" | "ARRAY_VALUE_OUT_OF_MIN_MAX_RANGE" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github343_label_invalid_2.json -s json -t {resourceDir}/github343/test_data/I52_20210207_1A_U1B03A_01_0001.avgs_bad_noname.xml" | "report_github343_label_invalid_2.json" |

# https://github.com/nasa-pds/validate/issues/366 validate should not check if file is PDF/A if --skip-content-validation is enabled
# github366 reuses github164
# Github quirk: it needs a directory src/test/resources/github366 to exist
 |"NASA-PDS/validate#366 INVALID_1_WITH_CONTENT_VALIDATION" | "github366" | 1 | "INVALID_1_WITH_CONTENT_VALIDATION 1 warn message expected: 1 NON_PDFA_FILE, reuse github164" | "NON_PDFA_FILE" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github366_label_pdfa_invalid_with_content_validation.json -s json -t {resourceDir}/github164/invalid/document_test_1_pdf.xml" | "report_github366_label_pdfa_invalid_with_content_validation.json" |
 |"NASA-PDS/validate#366 VALID_1_WITH_CONTENT_VALIDATION" | "github366" | 0 | "VALID_1_WITH_CONTENT_VALIDATION 0 warn message expected: 0 NON_PDFA_FILE, reuse github164" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -skip-context-validation -r {reportDir}/report_github366_label_pdfa_valid_with_content_validation.json -s json -t {resourceDir}/github164/valid/document_pdfa_valid.xml" | "report_github366_label_pdfa_valid_with_content_validation.json" |
 |"NASA-PDS/validate#366 VALID_2_SKIP_CONTENT_VALIDATION" | "github366" | 0 | "VALID_2_SKIP_CONTENT_VALIDATION 0 error messages expected: 0 totalErrors, reuse github164" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --skip-content-validation --skip-context-validation -r {reportDir}/report_github366_label_pdfa_valid_skip_content_validation.json -s json -t {resourceDir}/github164/valid/document_pdfa_valid.xml" | "report_github366_label_pdfa_valid_skip_content_validation.json" |

# https://github.com/nasa-pds/validate/issues/379 FileService:printStackTraceToFile:ERROR when validating a product with overlapping fields

 |"NASA-PDS/validate#379 INVALID" | "github379" | 1 | "1 errors message expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation --skip-context-reference-check -r {reportDir}/report_github379_label_invalid.json   -s json -t {resourceDir}/github379/mix_cal_hk_fpac_report_20181204.xml" | "report_github379_label_invalid.json" |

# https://github.com/nasa-pds/validate/issues/380 stack trace being created during successful validate execution

 |"NASA-PDS/validate#380 INVALID_1" | "github380" | 1 | "1 errors message expected: Reuse github379 resources" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation --skip-context-reference-check -r {reportDir}/report_github380_label_invalid_without_stack.json   -s json -t {resourceDir}/github379/mix_cal_hk_fpac_report_20181204.xml" | "report_github380_label_invalid_without_stack.json" |
 |"NASA-PDS/validate#380 INVALID_2" | "github380" | 1 | "1 errors message expected: Reuse github379 resources" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --debug-mode --skip-context-validation --skip-context-reference-check -r {reportDir}/report_github380_label_invalid_without_stack.json   -s json -t {resourceDir}/github379/mix_cal_hk_fpac_report_20181204.xml" | "report_github380_label_invalid_without_stack.json" |
 
# https://github.com/nasa-pds/validate/issues/375 validate halts if label has name "collection" embedded 

 |"NASA-PDS/validate#375 VALID" | "github375" | 0 | "0 error messages expected: 0 totalErrors" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.bundle --skip-content-validation --skip-context-validation -r {reportDir}/report_github375_bundle_valid.json -s json -t {resourceDir}/github375/h/bundle_gbo.ast.primass-l.spectra.xml" | "report_github375_bundle_valid.json" |

# https://github.com/NASA-PDS/validate/issues/368 Product referential integrity check throws invalid WARNINGs

 |"NASA-PDS/validate#368 VALID" | "github368" | 0 | "0 warnings expected for GENERAL_INFO." | "GENERAL_INFO" | "src/test/resources" | "target/test" | "-R pds4.bundle --skip-context-reference-check --skip-product-validation -r {reportDir}/report_github368_valid.json -s json -t {resourceDir}/github368/valid//bundle_kaguya_derived.xml " | "report_github368_valid.json" |

# https://github.com/nasa-pds/validate/issues/373 Update pds4 version mismatch warning message and problem type 

 |"NASA-PDS/validate#373 VALID" | "github373" | 1 | "1 INTEGRITY_PDS4_VERSION_MISMATCH message expected: reuse github240" | "INTEGRITY_PDS4_VERSION_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.bundle --skip-product-validation --skip-context-validation --skip-content-validation -r {reportDir}/report_github373_bundle_valid.json -s json -t {resourceDir}/github240/valid/bundle_kaguya_derived.xml" | "report_github373_bundle_valid.json" |
 |"NASA-PDS/validate#373 INVALID" | "github373" | 1 | "1 INTEGRITY_PDS4_VERSION_MISMATCH message expected: reuse github240" | "INTEGRITY_PDS4_VERSION_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.bundle --skip-product-validation --skip-context-validation --skip-content-validation -r {reportDir}/report_github373_bundle_invalid.json -s json -t {resourceDir}/github240/invalid/bundle_kaguya_derived.xml" | "report_github373_bundle_invalid.json" |

# https://github.com/nasa-pds/validate/issues/392 Validate throws incorrect overlap error when first Field_Bit has length 1

 |"NASA-PDS/validate#392 VALID" | "github392" | 0 | "0 error messages expected: 0 totalErrors" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github392_label_valid.json -s json -t {resourceDir}/github392/test1_valid.xml" | "report_github392_label_valid.json" |
 |"NASA-PDS/validate#392 INVALID_1" | "github392" | 1  | "1 error messages expected: 1 FIELD_VALUE_OVERLAP" | "FIELD_VALUE_OVERLAP" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github392_label_invalid_1.json -s json -t {resourceDir}/github392/test1_invalid.xml" | "report_github392_label_invalid_1.json" |
 |"NASA-PDS/validate#392 INVALID_2" | "github392" | 1  | "1 error messages expected: 1 FIELD_VALUE_OVERLAP" | "FIELD_VALUE_OVERLAP" | "src/test/resources" | "target/test" | "-R pds4.label --skip-context-validation -r {reportDir}/report_github392_label_invalid_2.json -s json -t {resourceDir}/github392/INVALID_odf07155_msgr_11.xml" | "report_github392_label_invalid_2.json" |

# https://github.com/nasa-pds/validate/issues/367 As a user, I want to validate all files referenced by a Product_Document
# Break up github367 one test into  multiple tests for accounting purposes, i.g. each problem type has its own count.

 |"NASA-PDS/validate#367 1_NON_PDFA_FILE" | "github367" | 1 | "1 : 1 NON_PDFA_FILE warn messages expected" | "NON_PDFA_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_PDFA_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_PDFA_FILE.json" |
 |"NASA-PDS/validate#367 2_NON_JPEG_FILE" | "github367" | 2 | "2 : 2 NON_JPEG_FILE warn messages expected" | "NON_JPEG_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_JPEG_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_JPEG_FILE.json" |
 |"NASA-PDS/validate#367 3_NON_PNG_FILE" | "github367" | 2 | "3: 2 NON_PNG_FILE warn messages expected" | "NON_PNG_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_PNG_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_PNG_FILE.json" |
 |"NASA-PDS/validate#367 4_NON_HTML_FILE" | "github367" | 2 | "4: 2 NON_HTML_FILE warn messages expected" | "NON_HTML_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_HTML_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_HTML_FILE.json" |
 |"NASA-PDS/validate#367 6_NON_MSWORD_FILE" | "github367" | 1 | "6: 1 NON_MSWORD_FILE warn messages expected" | "NON_MSWORD_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_MSWORD_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_MSWORD_FILE.json" |
 |"NASA-PDS/validate#367 7_NON_MSEXCEL_FILE" | "github367" | 1 | "7: 1 NON_MSEXCEL_FILE warn messages expected" | "NON_MSEXCEL_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_MSEXCEL_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_MSEXCEL_FILE.json" |
 |"NASA-PDS/validate#367 8_NON_LATEX_FILE" | "github367" | 2 | "8: 2 NON_LATEX_FILE warn messages expected" | "NON_LATEX_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_LATEX_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_LATEX_FILE.json" |
 |"NASA-PDS/validate#367 9_NON_POSTSCRIPT_FILE" | "github367" | 0 | "9 : 0 NON_POSTSCRIPT_FILE warn messages expected" | "NON_POSTSCRIPT_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_POSTSCRIPT_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_POSTSCRIPT_FILE.json" |
 |"NASA-PDS/validate#367 10_NON_ENCAPSULATED_POSTSCRIPT_FILE" | "github367" | 1 | "10 : 1 NON_ENCAPSULATED_POSTSCRIPT_FILE warn messages expected" | "NON_ENCAPSULATED_POSTSCRIPT_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_ENCAPSULATED_POSTSCRIPT_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_ENCAPSULATED_POSTSCRIPT_FILE.json" |
 |"NASA-PDS/validate#367 12_NON_GIF_FILE" | "github367" | 1 | "12 : 1 NON_GIF_FILE warn messages expected" | "NON_GIF_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_GIF_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_GIF_FILE.json" |
 |"NASA-PDS/validate#367 13_NON_TIFF_FILE" | "github367" | 2 | "13 : 2 NON_TIFF_FILE warn messages expected" | "NON_TIFF_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_TIFF_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_TIFF_FILE.json" |
 |"NASA-PDS/validate#367 14_NON_MP4_FILE" | "github367" | 2 | "14 :2 NON_MP4_FILE warn messages expected" | "NON_MP4_FILE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github367_bundle_valid_NON_MP4_FILE.json -s json -t {resourceDir}/github367/bundle_kaguya_derived.xml" | "report_github367_bundle_valid_NON_MP4_FILE.json" |

# https://github.com/nasa-pds/validate/issues/401 validate does not flag <CR> within lid_reference
 |"NASA-PDS/validate#401 INVALID" | "github401" | 3 | "3 error messages expected: 1 INVALID_FIELD_VALUE" | "INVALID_FIELD_VALUE" | "src/test/resources" | "target/test" | "-R pds4.bundle -r {reportDir}/report_github401_bundle_invalid.json -s json -t {resourceDir}/github401/invalid/bundle_kaguya_derived.xml" | "report_github401_bundle_invalid.json" |

# https://github.com/nasa-pds/validate/issues/408 Validate 2.1.0-SNAPSHOT skips a collection XML label

 |"NASA-PDS/validate#408 VALID" | "github408" | 0 | "0 error messages expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.bundle --skip-content-validation -r {reportDir}/report_github408_bundle_valid.json -s json -t {resourceDir}/github408/valid/bundle_insight_seis.xml" | "report_github408_bundle_valid.json" |

# https://github.com/nasa-pds/validate/issues/376 Checksums output lowercase and do not accept uppercase checksums

 |"NASA-PDS/validate#376 VALID" | "github376" | 0 | "0 error messages expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -M src/test/resources/github376/urn-nasa-pds-duxbury_pdart14_mariner69.md5 -r {reportDir}/report_github376_label_valid.json -s json -t {resourceDir}/github376/bundle_duxbury_pdart14_mariner69.xml" | "report_github376_label_valid.json" |

# https://github.com/NASA-PDS/validate/issues/416 validate 2.1.0 indicates the table offset is not correct when validating a binary table inside a FITS

 |"NASA-PDS/validate#416 VALID_1" | "github416" | 0 | "0 error messages expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github416_label_valid_1.json -s json -t {resourceDir}/github416/mix_raw_calib_mixs-c_sw_offset_table_20160301.xml" | "report_github416_label_valid_1.json" |
 |"NASA-PDS/validate#416 INVALID_1" | "github416" | 1 | "1 INVALID_OBJECT_DEFINITION error messages expected" | "INVALID_OBJECT_DEFINITION" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github416_label_invalid_1.json -s json -t {resourceDir}/github416/mix_raw_calib_mixs-c_sw_offset_table_20160301_invalid.xml" | "report_github416_label_invalid_1.json" |
 |"NASA-PDS/validate#416 VALID_2" | "github416" | 0 | "0 error messages expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github416_label_valid_2.json -s json -t {resourceDir}/github416/phe_misc_temperature_reference_20190524.xml" | "report_github416_label_valid_2.json" |
 |"NASA-PDS/validate#416 INVALID_2" | "github416" | 1 | "1 INVALID_OBJECT_DEFINITION error messages expected" | "INVALID_OBJECT_DEFINITION" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github416_label_invalid_2.json -s json -t {resourceDir}/github416/phe_misc_temperature_reference_20190524_invalid.xml" | "report_github416_label_invalid_2.json" |

# https://github.com/NASA-PDS/validate/issues/349 validate allows absolute path in directory_path_name but shouldn't

 |"NASA-PDS/validate#349 VALID" | "github349" | 0 | "0 error messages expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github349_label_valid.json -s json -t {resourceDir}/github349/valid/datasetgood.xml" | "report_github349_label_valid.json" |
 |"NASA-PDS/validate#349 INVALID" | "github349" | 1 | "1 error messages expected" | "UNALLOWED_DIRECTORY_NAME" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github349_label_invalid.json -s json -t {resourceDir}/github349/invalid/datasetbad.xml" | "report_github349_label_invalid.json" |

# https://github.com/NASA-PDS/validate/issues/419 validate 2.2.0-SNAPSHOT warns about a pretty benign bundle + readme.txt 


 |"NASA-PDS/validate#419 VALID" | "github419" | 0 | "0 warning messages expected" | "totalWarnings" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github419_label_valid.json -s json -t {resourceDir}/github419/bundle_astromat_chem.xml" | "report_github419_label_valid.json" |


# https://github.com/NASA-PDS/validate/issues/429 validate warns "document standard id ... is not correct" on good labels

 |"NASA-PDS/validate#429 VALID" | "github429" | 0 | "0 warning messages expected" | "totalWarnings" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github429_label_valid.json -s json -t {resourceDir}/github429/EPPS_EDR_SIS.xml" | "report_github429_label_valid.json" |


# https://github.com/nasa-pds/validate/issues/424 Validate does not allow SIP tab file to have lines of differing lengths  
# The checking should NOT be done based on the file extension but based on the table type.  The Table_Delimited can have variable length records.

 |"NASA-PDS/validate#424 VALID_1" | "github424" | 0 | "0 error messages expected: 0 RECORD_LENGTH_MISMATCH" | "RECORD_LENGTH_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github424_label_valid_1.json -s json -t {resourceDir}/github424/asurpif_photos_amboycrater_v1.0_20211021_sip_v1.0.xml" | "report_github424_label_valid_1.json" |
 |"NASA-PDS/validate#424 VALID_2" | "github424" | 0 | "0 error messages expected: 0 RECORD_LENGTH_MISMATCH" | "RECORD_LENGTH_MISMATCH" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github424_label_valid_2.json -s json -t {resourceDir}/github424/asurpif_photos_amboycrater_v1.0_20211021_aip_v1.0.xml" | "report_github424_label_valid_2.json" |

# https://github.com/nasa-pds/validate/issues/435 Array Content Validator is not accepting values at the min/max due to false precision

 |"NASA-PDS/validate#435 VALID" | "github435" | 0 | "0 error messages expected: 0 totalErrors" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github435_label_valid.json -s json -t {resourceDir}/github435/flat_w.xml" | "report_github435_label_valid.json" |

# https://github.com/nasa-pds/validate/issues/447 Validate does not correctly pass PDF/A files that are in a subdirectory

 |"NASA-PDS/validate#447 VALID" | "github447" | 0 | "0 error messages expected: 0 totalErrors" | "totalErrors" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github447_dir_valid.json -s json -t {resourceDir}/github447/document/" | "report_github447_dir_valid.json" |


# BIG_NOTE: Add new tests that doesn't involve a catalog above this line.
# https://github.com/NASA-PDS/validate/issues/297 Content validation of ASCII_Integer field does not accept value with leading zeroes
 |"NASA-PDS/validate#297 VALID" | "github297" | 0 | "0 errors message expected" | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -R pds4.label -r {reportDir}/report_github297_label_valid.json  -s json -t {resourceDir}/github297/valid/rimfax_rdr_0081_example.xml" | "report_github297_label_valid.json" |
 |"NASA-PDS/validate#297 INVALID" | "github297" | 1 | "1 error message expected" | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -R pds4.label -r {reportDir}/report_github297_label_invalid.json  -s json -t {resourceDir}/github297/invalid/rimfax_rdr_0081_example.xml" | "report_github297_label_invalid.json" |

# https://github.com/NASA-PDS/validate/issues/299 Validate tool does not PASS a bundle with a single-character filename
 |"NASA-PDS/validate#299 VALID" | "github299" | 0 | "0 errors message expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github299_label_valid.json  -s json -t {resourceDir}/github299/valid/gbo_ast_fieber-beyer_spectra_v2.0_20210211_aip_v1.0.xml" | "report_github299_label_valid.json" |
 |"NASA-PDS/validate#299 INVALID" | "github299" | 3 | "3 errors message expected" | "totalErrors" | "src/test/resources" | "target/test" | "-R pds4.label -r {reportDir}/report_github299_label_invalid.json  -s json -t {resourceDir}/github299/invalid/gbo_ast_fieber-beyer_spectra_v2.0_20210211_aip_v1.0.xml" | "report_github299_label_invalid.json" |

# BIG_NOTE: The tests for github6 has to be moved toward the beginning as leave them here results in error in information model.
# BIG_NOTE: The tests for github240 has to be moved toward the beginning as leave them here results in error in information model.

 |"NASA-PDS/validate#71 1" | "github71" | 0 | "0 error message expected" | "LABEL_UNRESOLVABLE_RESOURCE" |  "src/test/resources" | "target/test" |  "-r {reportDir}/report_github71_1.json -C {reportDir}/catalog.xml -s json --skip-content-validation -t {resourceDir}/github71/ELE_MOM.xml" | "report_github71_1.json" |
 |"NASA-PDS/validate#71 2" | "github71" | 0 | "0 error message expected" | "totalErrors" |  "src/test/resources" | "target/test" |  "-r {reportDir}/report_github71_2.json -s json  -C {reportDir}/catalog.xml -t {resourceDir}/github71/ELE_MOM_2.xml" | "report_github71_2.json" |
 |"NASA-PDS/validate#84 1" | "github84" | 0 | "0 error messages expected" | "totalErrors" |  "src/test/resources" | "target/test" |  "-r {reportDir}/report_github84_1.json -s json --skip-content-validation -c {resourceDir}/github84/config.txt -t {resourceDir}/github71/ELE_MOM.xml" | "report_github84_1.json" |

 |"NASA-PDS/validate#87 1" | "github87" | 0 | "0 errors expected" | "LABEL_UNRESOLVABLE_RESOURCE" | "src/test/resources" | "target/test" | "-r {reportDir}/report_github87_1.json -s json -R pds4.label --skip-content-validation -t {resourceDir}/github87/2t126632959btr0200p3002n0a1.xml {resourceDir}/github87/2t126646972btr0200p3001n0a1.xml -C {reportDir}/catalog.xml" | "report_github87_1.json" |

# Moved github292 tests to the end as they interfer with other test with the following error message:
#
# The attribute pds:information_model_version must be equal to the value '1.16.0.0'.
#
# Notes:
#   1.  The file catalog.xml must have been created by the Java test code in the expected location.
#   2.  The  -C {reportDir}/catalog.xml is needed otherwise the code will to use github87/pds/v1/PDS4_PDS_1G00.xsd (from the run above row)
#       which would result in (No such file or directory) error
#       Using schema/schematron from the previous run may be an issue with the validate software not flushing successfully.
#
# Table_Delimited tests

 |"NASA-PDS/validate#292 TABLE_DELIMITED VALID LF" | "github292" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_table_delimited_valid_lf.json -s json -R pds4.label -t {resourceDir}/github292/table_delimited/kgrs_calibrated_spectra_per1_LF_VALID.xml" | "report_github292_label_table_delimited_valid_lf.json" |
 |"NASA-PDS/validate#292 TABLE_DELIMITED VALID CRLF" | "github292" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_table_delimited_valid_crlf.json -s json -R pds4.label -t {resourceDir}/github292/table_delimited/kgrs_calibrated_spectra_per1_CRLF_VALID.xml" | "report_github292_label_table_delimited_valid_crlf.json" |
 |"NASA-PDS/validate#292 TABLE_DELIMITED INVALID LF" | "github292" | 1 | "1 error message expected for MISSING_LF." | "MISSING_LF" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_table_delimited_invalid_lf.json -s json -R pds4.label -t {resourceDir}/github292/table_delimited/kgrs_calibrated_spectra_per1_LF_FAIL.xml" | "report_github292_label_table_delimited_invalid_lf.json" |
 |"NASA-PDS/validate#292 TABLE_DELIMITED INVALID CR" | "github292" | 1 | "1 error message expected for MISSING_CRLF." | "MISSING_CRLF" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_table_delimited_invalid_crlf.json -s json -R pds4.label -t {resourceDir}/github292/table_delimited/kgrs_calibrated_spectra_per1_CRLF_FAIL.xml" | "report_github292_label_table_delimited_invalid_crlf.json" |

# Table_Character tests

 #|"NASA-PDS/validate#292 TABLE_CHARACTER VALID LF" | "github292" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_table_character_valid_lf.json -s json -R pds4.label -t {resourceDir}/github292/table_character/valid/minimal_test_product_lf.xml" | "report_github292_label_table_character_valid_lf.json" |
 #|"NASA-PDS/validate#292 TABLE_CHARACTER VALID CRLF" | "github292" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_table_character_valid_crlf.json -s json -R pds4.label -t {resourceDir}/github292/table_character/valid/minimal_test_product_crlf.xml" | "report_github292_label_table_character_valid_crlf.json" |
 #|"NASA-PDS/validate#292 TABLE_CHARACTER INVALID LF" | "github292" | 4 | "4 error messages expected for MISSING_LF." | "MISSING_LF" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_table_character_invalid_lf.json -s json -R pds4.label -t {resourceDir}/github292/table_character/invalid/minimal_test_product_lf.xml" | "report_github292_label_table_character_invalid_lf.json" |
 #|"NASA-PDS/validate#292 TABLE_CHARACTER INVALID CRLF" | "github292" | 4 | "4 error messages expected for MISSING_CRLF." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_table_character_invalid_crlf.json -s json -R pds4.label -t {resourceDir}/github292/table_character/invalid/minimal_test_product_crlf.xml" | "report_github292_label_table_character_invalid_crlf.json" |

# Inventory tests

 |"NASA-PDS/validate#292 INVENTORY VALID LF" | "github292" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_inventory_valid_lf.json -s json -R pds4.label -t {resourceDir}/github292/inventory/collection_eetable_inventory_LF_VALID.xml" | "report_github292_label_inventory_valid_lf.json" |
 |"NASA-PDS/validate#292 INVENTORY VALID CRLF" | "github292" | 0 | "0 error messages expected." | "totalErrors" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_inventory_valid_crlf.json -s json -R pds4.label -t {resourceDir}/github292/inventory/collection_eetable_inventory_CRLF_VALID.xml" | "report_github292_label_inventory_valid_crlf.json" |
 |"NASA-PDS/validate#292 INVENTORY INVALID LF" | "github292" | 3 | "3 error messages expected for MISSING_LF." | "MISSING_LF" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_inventory_invalid_lf.json -s json -R pds4.label -t {resourceDir}/github292/inventory/collection_eetable_inventory_LF_FAIL.xml" | "report_github292_label_inventory_invalid_lf.json" |
 |"NASA-PDS/validate#292 INVENTORY INVALID CRLF" | "github292" | 3 | "3 error messages expected for MISSING_CRLF." | "MISSING_CRLF" | "src/test/resources" | "target/test" | "--skip-context-validation -C {reportDir}/catalog.xml -schema  src/test/resources/github292/pds/v1/PDS4_PDS_1G00.xsd -schematron src/test/resources/github292/pds/v1/PDS4_PDS_1G00.sch -r {reportDir}/report_github292_label_inventory_invalid_crlf.json -s json -R pds4.label -t {resourceDir}/github292/inventory/collection_eetable_inventory_CRLF_FAIL.xml" | "report_github292_label_inventory_invalid_crlf.json" |


//
//  Header.h
//  
//
//  Created by Ebrahim Tahernejad on 11/2/23.
//

#ifndef Error_h
#define Error_h

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    ZSignStatusSuccess = 0,
    ZSignStatusInvalidFolderPath = 1,
    ZSignStatusInvalidPrivateKeyOrPassword = 2,
    ZSignStatusInvalidCertificate = 3,
    ZSignStatusCertificateAndPrivateKeyMismatch = 4,
    ZSignStatusCertificateCommonNameMissing = 5,
    ZSignStatusCertificateOrganizationalUnitMissing = 6,
    ZSignStatusSignAssetsMissing = 7,
    ZSignStatusAppFolderMissing = 8,
    ZSignStatusAppInfoPlistMissing = 9,
    ZSignStatusWritingEmbeddedProvisioningProfileFailed = 10,
    ZSignStatusAppInfoPlistIncomplete = 11,
    ZSignStatusFailedGettingSignableObjects = 12,
    ZSignStatusFailedMachOVariableArgumentListInitialization = 13,
    ZSignStatusFailedMachOSigningAsset = 14,
    ZSignStatusFailedParsingBundleExecuteFile = 15,
    ZSignStatusFailedCreatingCodeResources = 16,
    ZSignStatusFailedGettingChangedFileSHASumBase64 = 17,
    ZSignStatusFailedWritingCodeResource = 18,
    
} ZSignStatus;

#ifdef __cplusplus
}
#endif

#endif /* Error_h */

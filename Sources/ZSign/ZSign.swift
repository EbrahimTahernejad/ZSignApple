//
//  File.swift
//  
//
//  Created by Ebrahim Tahernejad on 11/2/23.
//

import Foundation
import ZSignCore

public enum ZSign {
    public typealias Error = ZSignStatus
    public func sign(
        _ folder: URL,
        cert: URL,
        privateKey: URL,
        provisioningProfile: URL,
        entitlements: URL? = nil,
        bundleIdentifier: String? = nil,
        password: String? = nil
    ) throws {
        let status = zsign(
            folder.path,
            cert.path,
            privateKey.path,
            provisioningProfile.path,
            entitlements?.path ?? "",
            bundleIdentifier ?? "",
            password ?? ""
        )
        guard status == ZSignStatusSuccess else {
            throw status
        }
    }
}

// MARK: - Errors
extension ZSignStatus: Error {}
extension ZSignStatus {
    public static var invalidFolderPath: ZSignStatus {
        ZSignStatusInvalidFolderPath
    }
    
    public static var invalidPrivateKeyOrPassword: ZSignStatus {
        ZSignStatusInvalidPrivateKeyOrPassword
    }
    
    public static var invalidCertificate: ZSignStatus {
        ZSignStatusInvalidCertificate
    }
    
    public static var certificateAndPrivateKeyMismatch: ZSignStatus {
        ZSignStatusCertificateAndPrivateKeyMismatch
    }
    
    public static var missingCertificateCN: ZSignStatus {
        ZSignStatusCertificateCommonNameMissing
    }
    
    public static var missingCertificateOU: ZSignStatus {
        ZSignStatusCertificateOrganizationalUnitMissing
    }
    
    public static var noSignAssets: ZSignStatus {
        ZSignStatusSignAssetsMissing
    }
    
    public static var noAppFolder: ZSignStatus {
        ZSignStatusAppFolderMissing
    }
    
    public static var noInfoPlist: ZSignStatus {
        ZSignStatusAppInfoPlistMissing
    }
    
    public static var failedWritingEmbeddedProfile: ZSignStatus {
        ZSignStatusWritingEmbeddedProvisioningProfileFailed
    }
    
    public static var infoPlistMissingKeys: ZSignStatus {
        ZSignStatusAppInfoPlistIncomplete
    }
    
    public static var failedGettingSignableObjects: ZSignStatus {
        ZSignStatusFailedGettingSignableObjects
    }
    
    public static var failedInitializingVA: ZSignStatus {
        ZSignStatusFailedMachOVariableArgumentListInitialization
    }
    
    public static var failedSigningAsset: ZSignStatus {
        ZSignStatusFailedMachOSigningAsset
    }
    
    public static var failedParsingBundleExecuteFile: ZSignStatus {
        ZSignStatusFailedParsingBundleExecuteFile
    }
    
    public static var failedCreatingCodeResources: ZSignStatus {
        ZSignStatusFailedCreatingCodeResources
    }
    
    public static var failedWritingCodeResource: ZSignStatus {
        ZSignStatusFailedWritingCodeResource
    }
    
    /*
     Useless error:
     ZSignStatusFailedGettingChangedFileSHASumBase64 = 17,
     */
}

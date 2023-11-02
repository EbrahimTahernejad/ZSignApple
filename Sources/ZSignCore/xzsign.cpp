#include "common/common.h"
#include "common/json.h"
#include "openssl.h"
#include "macho.h"
#include "bundle.h"
#include <libgen.h>
#include <dirent.h>
#include <getopt.h>
#include "error.h"


ZSignStatus zsign(
    const char *path,
    const char *certFile,
    const char *pKeyFile,
    const char *provFile,
    const char *entFile,
    const char *bundleId,
    const char *password
) {
	ZTimer gtimer;

	bool bForce = true;
	bool bInstall = false;
	bool bWeakInject = false;

	string strCertFile = certFile;
	string strPKeyFile = pKeyFile;
	string strProvFile = provFile;
	string strPassword = password;
	string strBundleId = bundleId;
	string strBundleVersion;
	string strDyLibFile;
	string strOutputFile;
	string strDisplayName;
	string strEntitlementsFile = entFile;

	string strPath = GetCanonicalizePath(path);
    
	if (!IsFileExists(strPath.c_str()))
	{
		ZLog::ErrorV(">>> Invalid Path! %s\n", strPath.c_str());
        return ZSignStatusInvalidFolderPath;
	}

	ZTimer timer;
	ZSignAsset zSignAsset;
    ZSignStatus assetInitStatus = zSignAsset.Init(strCertFile, strPKeyFile, strProvFile, strEntitlementsFile, strPassword);
	if (assetInitStatus != ZSignStatusSuccess)
	{
        return assetInitStatus;
	}

	bool bEnableCache = false;
	string strFolder = strPath;

	timer.Reset();
	ZAppBundle bundle;
	ZSignStatus bRet = bundle.SignFolder(&zSignAsset, strFolder, strBundleId, strBundleVersion, strDisplayName, strDyLibFile, bForce, bWeakInject, bEnableCache);
	timer.PrintResult(bRet, ">>> Signed %s!", bRet ? "OK" : "Failed");

	gtimer.Print(">>> Done.");
    return bRet;
	// return bRet ? 0 : -1;
}

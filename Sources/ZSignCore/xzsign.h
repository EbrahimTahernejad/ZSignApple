//
//  zsign.h
//  ZSign-iOS
//
//  Created by Ebrahim Tahernejad on 6/31/1402 AP.
//

#ifndef zsign_h
#define zsign_h

#include "error.h"

#ifdef __cplusplus
extern "C" {
#endif

ZSignStatus zsign(
    const char *path,
    const char *certFile,
    const char *pKeyFile,
    const char *provFile,
    const char *entFile,
    const char *bundleId,
    const char *password
);

#ifdef __cplusplus
}
#endif

#endif /* zsign_h */

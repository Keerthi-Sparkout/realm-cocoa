////////////////////////////////////////////////////////////////////////////
//
// Copyright 2020 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

#import "RLMUsernamePasswordProviderClient.h"
#import "RLMApp_Private.hpp"

@implementation RLMUsernamePasswordProviderClient

- (void)registerEmail:(NSString *)email
             password:(NSString *)password
           completion:(RLMOptionalErrorBlock)completion {
    self.app._realmApp.provider_client<realm::app::App::UsernamePasswordProviderClient>().
    register_email(email.UTF8String, password.UTF8String, ^(Optional<realm::app::AppError> error) {
        [self.app handleResponse:error completion:completion];
    });
}

- (void)confirmUser:(NSString *)token
            tokenId:(NSString *)tokenId
         completion:(RLMOptionalErrorBlock)completion {
    self.app._realmApp.provider_client<realm::app::App::UsernamePasswordProviderClient>().
    confirm_user(token.UTF8String, tokenId.UTF8String, ^(Optional<realm::app::AppError> error) {
        [self.app handleResponse:error completion:completion];
    });
}

- (void)resendConfirmationEmail:(NSString *)email
                     completion:(RLMOptionalErrorBlock)completion {
    self.app._realmApp.provider_client<realm::app::App::UsernamePasswordProviderClient>().
    resend_confirmation_email(email.UTF8String, ^(Optional<realm::app::AppError> error) {
        [self.app handleResponse:error completion:completion];
    });
}

- (void)sendResetPasswordEmail:(NSString *)email
                    completion:(RLMOptionalErrorBlock)completion {
    self.app._realmApp.provider_client<realm::app::App::UsernamePasswordProviderClient>().
    send_reset_password_email(email.UTF8String, ^(Optional<realm::app::AppError> error) {
        [self.app handleResponse:error completion:completion];
    });
}

- (void)resetPasswordTo:(NSString *)password
                  token:(NSString *)token
                tokenId:(NSString *)tokenId
             completion:(RLMOptionalErrorBlock)completion {
    self.app._realmApp.provider_client<realm::app::App::UsernamePasswordProviderClient>().
    reset_password(password.UTF8String, token.UTF8String, tokenId.UTF8String, ^(Optional<realm::app::AppError> error) {
        [self.app handleResponse:error completion:completion];
    });
}

- (void)callResetPasswordFunction:(NSString *)email
                         password:(NSString *)password
                             args:(NSString *)args
                       completion:(RLMOptionalErrorBlock)completion {
    if (!args.length) {
        args = @"{}";
    }
    self.app._realmApp.provider_client<realm::app::App::UsernamePasswordProviderClient>().
    call_reset_password_function(email.UTF8String, password.UTF8String, args.UTF8String, ^(Optional<realm::app::AppError> error) {
        [self.app handleResponse:error completion:completion];
    });
}

@end
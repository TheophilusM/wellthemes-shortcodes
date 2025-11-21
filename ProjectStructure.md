## Setting up Flutter folder structure
```shell

@echo off
echo Setting up Flutter folder structure...

:: --- Root ---
if not exist main.dart ( echo // Entry point > main.dart )

:: --- _Core ---

:: Constants
if not exist "lib\_core\constants" mkdir "lib\_core\constants"
if not exist "lib\_core\constants\api_constants.dart" ( echo // API Constants > "lib\_core\constants\api_constants.dart" )
if not exist "lib\_core\constants\storage_keys.dart" ( echo // Storage Keys > "lib\_core\constants\storage_keys.dart" )

:: Exceptions
if not exist "lib\_core\exceptions" mkdir "lib\_core\exceptions"
if not exist "lib\_core\exceptions\api_exception.dart" ( echo // API Exceptions > "lib\_core\exceptions\api_exception.dart" )

:: Network
if not exist "lib\_core\network" mkdir "lib\_core\network"
if not exist "lib\_core\network\api_client.dart" ( echo // API Client > "lib\_core\network\api_client.dart" )
if not exist "lib\_core\network\api_interceptor.dart" ( echo // API Interceptor > "lib\_core\network\api_interceptor.dart" )

:: Providers
if not exist "lib\_core\providers" mkdir "lib\_core\providers"
if not exist "lib\_core\providers\providers.dart" ( echo // Global Providers > "lib\_core\providers\providers.dart" )

:: Services
if not exist "lib\_core\services" mkdir "lib\_core\services"
if not exist "lib\_core\services\device_info_service.dart" ( echo // Device Info Service > "lib\_core\services\device_info_service.dart" )
if not exist "lib\_core\services\storage_service.dart" ( echo // Storage Service > "lib\_core\services\storage_service.dart" )
if not exist "lib\_core\services\token_manager.dart" ( echo // Token Manager > "lib\_core\services\token_manager.dart" )

:: Widgets
if not exist "lib\_core\widgets" mkdir "lib\_core\widgets"
if not exist "lib\_core\widgets\auth_wrapper.dart" ( echo // Auth Wrapper > "lib\_core\widgets\auth_wrapper.dart" )


:: --- _Features ---

:: Auth Controllers
if not exist "lib\_features\auth\controllers" mkdir "lib\_features\auth\controllers"
if not exist "lib\_features\auth\controllers\auth_controller.dart" ( echo // Auth Controller > "lib\_features\auth\controllers\auth_controller.dart" )

:: Auth Models
if not exist "lib\_features\auth\models" mkdir "lib\_features\auth\models"
if not exist "lib\_features\auth\models\auth_request.dart" ( echo // Auth Request Model > "lib\_features\auth\models\auth_request.dart" )
if not exist "lib\_features\auth\models\auth_response.dart" ( echo // Auth Response Model > "lib\_features\auth\models\auth_response.dart" )
if not exist "lib\_features\auth\models\auth_state.dart" ( echo // Auth State Model > "lib\_features\auth\models\auth_state.dart" )
if not exist "lib\_features\auth\models\jwt_user.dart" ( echo // JWT User Model > "lib\_features\auth\models\jwt_user.dart" )
if not exist "lib\_features\auth\models\user_profile.dart" ( echo // User Profile Model > "lib\_features\auth\models\user_profile.dart" )

:: Auth Screens
if not exist "lib\_features\auth\screens" mkdir "lib\_features\auth\screens"
if not exist "lib\_features\auth\screens\login_screen.dart" ( echo // Login Screen > "lib\_features\auth\screens\login_screen.dart" )
if not exist "lib\_features\auth\screens\mfa_verification_screen.dart" ( echo // MFA Screen > "lib\_features\auth\screens\mfa_verification_screen.dart" )

:: Auth Services
if not exist "lib\_features\auth\services" mkdir "lib\_features\auth\services"
if not exist "lib\_features\auth\services\auth_service.dart" ( echo // Auth Service > "lib\_features\auth\services\auth_service.dart" )

echo.
echo Structure created successfully!
pause
```

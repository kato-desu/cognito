import 'package:amazon_cognito_identity_dart_2/cognito.dart';

// Cognito User Pool
// 自分で決めたドメイン
// ex.) 'foo-bar123'
const cognitoDomain = 'yume1';

// ユーザープールID
// ex.) 'us-east-1_XXXXXXXXX'
const cognitoUserPoolId = 'ap-northeast-1_B44IeVmWR';

// アプリクライアントID
// ex.) 'xxxxxxxxxxxxxxxxxxxxxxxxxx'
const cognitoClientId = '5hq45q4dm17cb8b9fd3ens1c1d';

// コールバックURL
// "://"が含まれないことに注意
const callbackScheme = 'myapp';

// 今回はAUthorization Codeでのレスポンスが欲しいので'code'を指定
// ほかにも'token'なども指定可能
const cognitoOAuthResponseType = 'code';

// ユーザープールで設定したScopeのうちここで使いたいScopeをスペースで区切って入力
const cognitoScope = 'openid email';

// Create Cognito User Pool
// 上で設定したプールIDとアプリクライアントIDをつかって, CognitoUserPoolクラスのオブジェクトを作成.
// これ以降, このオブジェクトを使いまくります
final cognitoUserPool = CognitoUserPool(cognitoUserPoolId, cognitoClientId);

// Cognito ID Pool
// IDプールのID
// ex.) 'us-east-1:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
const cognitoIdentityPoolId = 'ap-northeast-1:590183798763:userpool/ap-northeast-1_B44IeVmWR';

// Lambda / API Gateway
// ex.) 'https://xxxxxxxxxx.execute-api.us-east-1.amazonaws.com'
const apiEndpoint = 'https://cognito-idp.ap-northeast-1.amazonaws.com/ap-northeast-1_gJDbSXUWb/.well-known/jwks.json';

import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Time "mo:base/Time";
import Nat "mo:base/Nat";

actor DigASsete {
    type Asset = {
        id: Text;
        owner: Principal;
        metadata: Text;
        qrCodeURL: Text;
    };

    stable var assets: [Asset] = [];

    func generateUniqueId(caller: Principal, metadata: Text): Text {
        let timestamp = Time.now(); 
        let uniqueId = Text.concat(Text.fromPrincipal(caller), "" #
metadata # "" # Text.fromNat(timestamp));
        return uniqueId;
    }


service like Google API)
    func generateQRCodeURL(id: Text): Text {
        let baseURL =
"https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=";
        let qrCodeURL = baseURL # id;
        return qrCodeURL;
    }

    public shared({caller}) func registerAsset(metadata: Text): async Text {
        let uniqueId = generateUniqueId(caller, metadata);
        let qrCodeURL = generateQRCodeURL(uniqueId);      
QR code URL
        let asset = {
            id = uniqueId;
            owner = caller;
            metadata = metadata;
            qrCodeURL = qrCodeURL;
        };
        assets := Array.append(assets, [asset]);
        return "Asset registered successfully with ID: " # uniqueId #
" and QR Code URL: " # qrCodeURL;
    };
    public func verifyAsset(id: Text): async ?Asset {
        for (asset in assets.vals()) {
            if (asset.id == id) {
                return ?asset;
            }
        };
        return null;
    };
};
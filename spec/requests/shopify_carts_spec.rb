describe "shopify_carts", :type => :request do
  it 'updates on received hooks' do
    params = {
      "id": "eeafa272cebfd4b22385bc4b645e762c",
      "token": "eeafa272cebfd4b22385bc4b645e762c",
      "line_items": [
        {
          "id": 704912205188288575,
          "properties": {
          },
          "quantity": 3,
          "variant_id": 704912205188288575,
          "key": "704912205188288575:33f11f7a1ec7d93b826de33bb54de37b",
          "discounted_price": "19.99",
          "discounts": [
          ],
          "gift_card": false,
          "grams": 200,
          "line_price": "59.97",
          "original_line_price": "59.97",
          "original_price": "19.99",
          "price": "19.99",
          "product_id": 788032119674292922,
          "sku": "example-shirt-s",
          "taxable": true,
          "title": "Example T-Shirt - ",
          "total_discount": "0.00",
          "vendor": "Acme",
          "discounted_price_set": {
            "shop_money": {
              "amount": "19.99",
              "currency_code": "USD"
            },
            "presentment_money": {
              "amount": "19.99",
              "currency_code": "USD"
            }
          },
          "line_price_set": {
            "shop_money": {
              "amount": "59.97",
              "currency_code": "USD"
            },
            "presentment_money": {
              "amount": "59.97",
              "currency_code": "USD"
            }
          },
          "original_line_price_set": {
            "shop_money": {
              "amount": "59.97",
              "currency_code": "USD"
            },
            "presentment_money": {
              "amount": "59.97",
              "currency_code": "USD"
            }
          },
          "price_set": {
            "shop_money": {
              "amount": "19.99",
              "currency_code": "USD"
            },
            "presentment_money": {
              "amount": "19.99",
              "currency_code": "USD"
            }
          },
          "total_discount_set": {
            "shop_money": {
              "amount": "0.0",
              "currency_code": "USD"
            },
            "presentment_money": {
              "amount": "0.0",
              "currency_code": "USD"
            }
          }
        }
      ],
      "note": nil,
      "updated_at": "2019-03-06T19:33:44.020Z",
      "created_at": "2019-03-06T19:33:44.020Z"
    }

    headers = {
      'topic': 'carts/update',
      'domain': 'my-patriotic-shop.com',
      'some-hash': 'asdASDasd'
    }

    post "/shopify/carts", params: params, headers: headers

    expect(
      UserSession.find_by(session_id: 'eeafa272cebfd4b22385bc4b645e762c').value
    ).to eq 59.97
  end
end

___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Hero Product Mapper",
  "description": "The template will help you create a new product object variable that maps the data from your original product object into the product object expected by Hero",
  "categories": ["ATTRIBUTION"],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "productObject",
    "displayName": "Product Object (Required)",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "valueHint": "Product object / array variable"
  },
  {
    "type": "TEXT",
    "name": "idParameter",
    "displayName": "id",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "nameParameter",
    "displayName": "name",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "priceParameter",
    "displayName": "price",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "currencyParameter",
    "displayName": "currency",
    "simpleValueType": true,
    "help": "Product currency (matching the ISO 4217 standard)",
    "valueHint": "USD",
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^[A-Z]{3}$"
        ]
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "quantityParameter",
    "displayName": "quantity",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "brandParameter",
    "displayName": "brand",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "categoryParameter",
    "displayName": "category",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "variantParameter",
    "displayName": "variant",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "locationParameter",
    "displayName": "location",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^(http:\\/\\/www\\.|https:\\/\\/www\\.|http:\\/\\/|https:\\/\\/)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$"
        ]
      }
    ],
    "help": "Product location url"
  },
  {
    "type": "TEXT",
    "name": "imageParameter",
    "displayName": "image",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^(http:\\/\\/www\\.|https:\\/\\/www\\.|http:\\/\\/|https:\\/\\/)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$"
        ]
      }
    ],
    "help": "Product image url"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');

const products = data.productObject;
const type = typeof products === 'object' && products.length >= 1 ? 'array' : 'object'; 

let productArray = [];

if (type === 'object') {
  productArray.push({
    id: products[data.idParameter || 'id'],
    name: products[data.nameParameter || 'name'],
    price: products[data.priceParameter || 'price'],
    currency: products[data.priceParameter || 'price'],
    quantity: products[data.quantityParameter || 'quantity'],
    brand: products[data.brandParameter || 'brand'],
    category: products[data.categoryParameter || 'category'],
    variant: products[data.variantParameter || 'variant'],
    location: products[data.imageParameter || 'image'],
    image: products[data.imageParameter || 'image']
  });
} else if (type === 'array') {
  productArray = products.map((product) => ({
    id: product[data.idParameter || 'id'],
    name: product[data.nameParameter || 'name'],
    price: product[data.priceParameter || 'price'],
    currency: product[data.currencyParameter || 'currency'],
    quantity: product[data.quantityParameter || 'quantity'],
    brand: product[data.brandParameter || 'brand'],
    category: product[data.categoryParameter || 'category'],
    variant: product[data.variantParameter || 'variant'],
    location: product[data.locationParameter || 'location'],
    image: product[data.imageParameter || 'image']
  }));
}

log(productArray);
return productArray;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 27/03/2020, 11:04:44



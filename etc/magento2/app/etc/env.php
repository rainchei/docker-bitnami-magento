<?php
return [
    'backend' => [
        'frontName' => 'admin_portal'
    ],
    'queue' => [
        'consumers_wait_for_messages' => 1
    ],
    'crypt' => [
        'key' => 'e00a9ce0e03fbf77cbfd9282f1d3583d'
    ],
    'db' => [
        'table_prefix' => '',
        'connection' => [
            'default' => [
                'host' => 'mysql.db.svc.cluster.local',
                'dbname' => 'magento',
                'username' => 'magento',
                'password' => 'magento',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1',
                'driver_options' => [
                    1014 => false
                ]
            ]
        ]
    ],
    'resource' => [
        'default_setup' => [
            'connection' => 'default'
        ]
    ],
    'x-frame-options' => 'SAMEORIGIN',
    'MAGE_MODE' => 'production',
    'session' => [
        'save' => 'files'
    ],
    'cache' => [
        'frontend' => [
            'default' => [
                'id_prefix' => '5a4_'
            ],
            'page_cache' => [
                'id_prefix' => '5a4_'
            ]
        ]
    ],
    'lock' => [
        'provider' => 'db',
        'config' => [
            'prefix' => ''
        ]
    ],
    'cache_types' => [
        'config' => 1,
        'layout' => 1,
        'block_html' => 1,
        'collections' => 1,
        'reflection' => 1,
        'db_ddl' => 1,
        'compiled_config' => 1,
        'eav' => 1,
        'customer_notification' => 1,
        'config_integration' => 1,
        'config_integration_api' => 1,
        'full_page' => 1,
        'config_webservice' => 1,
        'translate' => 1
    ],
    'install' => [
        'date' => 'Sun, 15 Mar 2020 16:12:37 +0000'
    ],
    'system' => [
        'default' => [
            'admin' => [
                'url' => [
                    'custom' => null
                ]
            ],
            'dev' => [
                'js' => [
                    'session_storage_key' => 'collected_errors'
                ],
                'restrict' => [
                    'allow_ips' => null
                ]
            ],
            'system' => [
                'smtp' => [
                    'host' => 'localhost',
                    'port' => '25'
                ]
            ],
            'web' => [
                'unsecure' => [
                    'base_url' => 'http://localhost-magento.example.com/',
                    'base_link_url' => '{{unsecure_base_url}}'
                ],
                'secure' => [
                    'base_url' => 'https://localhost-magento.example.com/',
                    'base_link_url' => '{{secure_base_url}}'
                ],
                'default' => [
                    'front' => 'cms'
                ]
            ],
            'currency' => [
                'import' => [
                    'error_email' => null
                ]
            ],
            'customer' => [
                'create_account' => [
                    'email_domain' => 'example.com'
                ]
            ],
            'catalog' => [
                'search' => [
                    'elasticsearch_server_hostname' => 'localhost',
                    'elasticsearch_server_port' => '9200',
                    'elasticsearch_index_prefix' => 'magento2',
                    'elasticsearch_enable_auth' => '0',
                    'elasticsearch_server_timeout' => '15',
                    'elasticsearch5_server_hostname' => 'localhost',
                    'elasticsearch5_server_port' => '9200',
                    'elasticsearch5_index_prefix' => 'magento2',
                    'elasticsearch5_enable_auth' => '0',
                    'elasticsearch5_server_timeout' => '15',
                    'elasticsearch6_server_hostname' => 'localhost',
                    'elasticsearch6_server_port' => '9200',
                    'elasticsearch6_index_prefix' => 'magento2',
                    'elasticsearch6_enable_auth' => '0',
                    'elasticsearch6_server_timeout' => '15'
                ],
                'productalert_cron' => [
                    'error_email' => null
                ]
            ],
            'payment' => [
                'authorizenet_directpost' => [
                    'debug' => '0',
                    'email_customer' => '0',
                    'login' => null,
                    'merchant_email' => null,
                    'test' => '1',
                    'trans_key' => null,
                    'trans_md5' => null,
                    'cgi_url' => 'https://secure.authorize.net/gateway/transact.dll',
                    'cgi_url_td' => 'https://api2.authorize.net/xml/v1/request.api'
                ],
                'payflowpro' => [
                    'user' => null,
                    'pwd' => null
                ],
                'payflow_link' => [
                    'pwd' => null,
                    'url_method' => 'GET'
                ],
                'payflow_advanced' => [
                    'user' => null,
                    'pwd' => null,
                    'url_method' => 'GET'
                ],
                'authorizenet_acceptjs' => [
                    'email_customer' => '0',
                    'login' => null,
                    'trans_key' => null,
                    'trans_md5' => null
                ],
                'braintree' => [
                    'private_key' => null
                ]
            ],
            'contact' => [
                'email' => [
                    'recipient_email' => 'hello@example.com'
                ]
            ],
            'carriers' => [
                'dhl' => [
                    'account' => null,
                    'gateway_url' => 'https://xmlpi-ea.dhl.com/XMLShippingServlet',
                    'id' => null,
                    'password' => null
                ],
                'fedex' => [
                    'account' => null,
                    'meter_number' => null,
                    'key' => null,
                    'password' => null,
                    'sandbox_mode' => '0',
                    'production_webservices_url' => 'https://ws.fedex.com:443/web-services/',
                    'sandbox_webservices_url' => 'https://wsbeta.fedex.com:443/web-services/'
                ],
                'ups' => [
                    'access_license_number' => null,
                    'gateway_url' => 'https://www.ups.com/using/services/rave/qcostcgi.cgi',
                    'gateway_xml_url' => 'https://onlinetools.ups.com/ups.app/xml/Rate',
                    'tracking_xml_url' => 'https://onlinetools.ups.com/ups.app/xml/Track',
                    'username' => null,
                    'password' => null,
                    'is_account_live' => '0'
                ],
                'usps' => [
                    'gateway_url' => 'http://production.shippingapis.com/ShippingAPI.dll',
                    'gateway_secure_url' => 'https://secure.shippingapis.com/ShippingAPI.dll',
                    'userid' => null,
                    'password' => null
                ]
            ],
            'trans_email' => [
                'ident_custom1' => [
                    'email' => 'custom1@example.com',
                    'name' => 'Custom 1'
                ],
                'ident_custom2' => [
                    'email' => 'custom2@example.com',
                    'name' => 'Custom 2'
                ],
                'ident_general' => [
                    'email' => 'owner@example.com',
                    'name' => 'Owner'
                ],
                'ident_sales' => [
                    'email' => 'sales@example.com',
                    'name' => 'Sales'
                ],
                'ident_support' => [
                    'email' => 'support@example.com',
                    'name' => 'CustomerSupport'
                ]
            ],
            'analytics' => [
                'url' => [
                    'signup' => 'https://advancedreporting.rjmetrics.com/signup',
                    'update' => 'https://advancedreporting.rjmetrics.com/update',
                    'bi_essentials' => 'https://dashboard.rjmetrics.com/v2/magento/signup',
                    'otp' => 'https://advancedreporting.rjmetrics.com/otp',
                    'report' => 'https://advancedreporting.rjmetrics.com/report',
                    'notify_data_changed' => 'https://advancedreporting.rjmetrics.com/report'
                ]
            ],
            'newrelicreporting' => [
                'general' => [
                    'api_url' => 'https://api.newrelic.com/deployments.xml',
                    'insights_api_url' => 'https://insights-collector.newrelic.com/v1/accounts/%s/events'
                ]
            ],
            'paypal' => [
                'wpp' => [
                    'api_password' => null,
                    'api_signature' => null,
                    'api_username' => null
                ],
                'fetch_reports' => [
                    'ftp_login' => null,
                    'ftp_password' => null
                ]
            ],
            'fraud_protection' => [
                'signifyd' => [
                    'api_url' => 'https://api.signifyd.com/v2/',
                    'api_key' => null
                ]
            ],
            'sitemap' => [
                'generate' => [
                    'error_email' => null
                ]
            ],
            'crontab' => [
                'default' => [
                    'jobs' => [
                        'analytics_subscribe' => [
                            'schedule' => [
                                'cron_expr' => '0 * * * *'
                            ]
                        ],
                        'analytics_collect_data' => [
                            'schedule' => [
                                'cron_expr' => '00 02 * * *'
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
];

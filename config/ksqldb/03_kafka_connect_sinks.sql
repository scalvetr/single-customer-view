SHOW STREAMS;

-- https://github.com/mongodb/mongo-kafka/blob/master/config/MongoSinkConnector.properties
CREATE
SINK CONNECTOR `event_customer_entity-sink`
WITH (
    'connection.uri'='mongodb://user:password@mongodb-single-customer-view/single-customer-view',
    'connector.class'='com.mongodb.kafka.connect.MongoSinkConnector',
    'database'='single-customer-view',

    'key.converter'='org.apache.kafka.connect.storage.StringConverter',
    'value.converter'='io.confluent.connect.avro.AvroConverter',
    'value.converter.schema.registry.url'='http://schema-registry:8081',

    'topics'='event_customer_entity',

    -- Collection names
    'collection'='customers',

    -- Id Strategy
    'post.processor.chain'='com.mongodb.kafka.connect.sink.processor.DocumentIdAdder',
    'document.id.strategy'='com.mongodb.kafka.connect.sink.processor.id.strategy.ProvidedInKeyStrategy', -- _id field in key

    'transforms'='ValueToKey,RenameField',

    'transforms.ValueToKey.type'='org.apache.kafka.connect.transforms.ValueToKey',
    'transforms.ValueToKey.fields'='customer_id',

    'transforms.RenameField.type'='org.apache.kafka.connect.transforms.ReplaceField$Key',
    'transforms.RenameField.renames'='customer_id:_id'
);

CREATE
SINK CONNECTOR `event_contact_center_customer_cases-sink`
WITH (
    'connection.uri'='mongodb://user:password@mongodb-single-customer-view/single-customer-view',
    'connector.class'='com.mongodb.kafka.connect.MongoSinkConnector',
    'database'='single-customer-view',

    'key.converter'='org.apache.kafka.connect.storage.StringConverter',
    'value.converter'='io.confluent.connect.avro.AvroConverter',
    'value.converter.schema.registry.url'='http://schema-registry:8081',

    'topics'='event_contact_center_customer_cases',

    -- Collection names
    'collection'='cases',

    -- Id Strategy
    'post.processor.chain'='com.mongodb.kafka.connect.sink.processor.DocumentIdAdder',
    'document.id.strategy'='com.mongodb.kafka.connect.sink.processor.id.strategy.ProvidedInKeyStrategy', -- _id field in key

    'transforms'='ValueToKey,RenameField',

    'transforms.ValueToKey.type'='org.apache.kafka.connect.transforms.ValueToKey',
    'transforms.ValueToKey.fields'='case_id',

    'transforms.RenameField.type'='org.apache.kafka.connect.transforms.ReplaceField$Key',
    'transforms.RenameField.renames'='case_id:_id'
);

CREATE
SINK CONNECTOR `event_core_banking_account_bookings-sink`
WITH (
    'connection.uri'='mongodb://user:password@mongodb-single-customer-view/single-customer-view',
    'connector.class'='com.mongodb.kafka.connect.MongoSinkConnector',
    'database'='single-customer-view',

    'key.converter'='org.apache.kafka.connect.storage.StringConverter',
    'value.converter'='io.confluent.connect.avro.AvroConverter',
    'value.converter.schema.registry.url'='http://schema-registry:8081',

    'topics'='event_core_banking_account_bookings',

    -- Collection names
    'collection'='accounts',

    -- Id Strategy
    'post.processor.chain'='com.mongodb.kafka.connect.sink.processor.DocumentIdAdder',
    'document.id.strategy'='com.mongodb.kafka.connect.sink.processor.id.strategy.ProvidedInKeyStrategy', -- _id field in key

    'transforms'='ValueToKey,RenameField',

    'transforms.ValueToKey.type'='org.apache.kafka.connect.transforms.ValueToKey',
    'transforms.ValueToKey.fields'='account_id',

    'transforms.RenameField.type'='org.apache.kafka.connect.transforms.ReplaceField$Key',
    'transforms.RenameField.renames'='account_id:_id'
);

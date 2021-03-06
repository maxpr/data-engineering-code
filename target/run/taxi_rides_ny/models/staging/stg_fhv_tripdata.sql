

  create or replace view `zoom-camp-project-23525`.`dbt_mpremi`.`stg_fhv_tripdata`
  OPTIONS()
  as 


select 
    to_hex(md5(cast(coalesce(cast(dispatching_base_num as 
    string
), '') || '-' || coalesce(cast(Affiliated_base_number as 
    string
), '') || '-' || coalesce(cast(pickup_datetime as 
    string
), '') as 
    string
))) as tripid,
    dispatching_base_num,
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime  as timestamp) as dropoff_datetime,
    cast(PULocationID as integer) pickup_locationid,
    cast(DOLocationID as integer) dropoff_locationid,
    SR_Flag as sr_flag,
    Affiliated_base_number as a_base_number,

from `zoom-camp-project-23525`.`trips_data_all`.`fhv_tripdata`

-- dbt build --m <model.sql> --var 'is_test_run: false'
;


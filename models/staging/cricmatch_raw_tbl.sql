
{{ config(
    materialized='table',
    description="This model selects all active records from the source and materializes them as a permanent table."
) }}

	SELECT 
        x.$1:meta::variant as meta,
        x.$1:info::variant as info,
        x.$1:innings::variant as innings,
        metadata$filename as file_name,
        metadata$file_row_number int,
        metadata$file_content_key  text,
        metadata$file_last_modified stg_modified_ts  

	FROM @my_stg_land/cricket/json/ (file_format => 'my_json_format') x



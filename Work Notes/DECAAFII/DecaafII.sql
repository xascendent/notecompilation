  
CREATE TABLE [dbo].[FEB_082021_DEMRI_Postablation](
	[document_number] [INT] NULL,
	[patient_name] [VARCHAR](255) NULL,
	[patient_mrn] [VARCHAR](50) NULL,
	[date_of_report] [DATE] NULL,
	[date_of_mri] [NVARCHAR](50) NULL,
	[provider] [VARCHAR](255) NULL,
	[processing_type] [VARCHAR](255) NULL,
	[la_enhancement] [REAL] NULL,
	[la_volume] [REAL] NULL,
	[utah_classification] [VARCHAR](10) NULL,
	[mri_quality] [VARCHAR](255) NULL,
	[number_of_right_pvs] [REAL] NULL,
	[number_of_left_pvs] [REAL] NULL,
	[la_volume_index] [REAL] NULL,
	[la_surface_area] [REAL] NULL,
	[patient_height] [REAL] NULL,
	[patient_weight] [REAL] NULL,
	[bmi] [REAL] NULL,
	[gender] [VARCHAR](50) NULL,
	[dob] [VARCHAR](255) NULL,
	[posterior_enhanced] [REAL] NULL,
	[posterior_percent_of_total_enhanced] [REAL] NULL,
	[posterior_region_enhanced] [REAL] NULL,
	[posterior_volume] [REAL] NULL,
	[posterior_volume_percent] [REAL] NULL,
	[posterior_surface_area] [REAL] NULL,
	[posterior_surface_area_percent] [REAL] NULL,
	[anterior_enhanced] [REAL] NULL,
	[anterior_percent_of_total_enhanced] [REAL] NULL,
	[anterior_region_enhanced] [REAL] NULL,
	[anterior_volume] [REAL] NULL,
	[anterior_volume_percent] [REAL] NULL,
	[anterior_surface_area] [REAL] NULL,
	[anterior_surface_area_percent] [REAL] NULL,
	[lateral_enhanced] [REAL] NULL,
	[lateral_percent_of_total_enhanced] [REAL] NULL,
	[lateral_region_enhanced] [REAL] NULL,
	[lateral_volume] [REAL] NULL,
	[lateral_volume_percent] [REAL] NULL,
	[lateral_surface_area] [REAL] NULL,
	[lateral_surface_area_percent] [REAL] NULL,
	[septal_enhanced] [REAL] NULL,
	[septal_percent_of_total_enhanced] [REAL] NULL,
	[septal_region_enhanced] [REAL] NULL,
	[septal_volume] [REAL] NULL,
	[septal_volume_percent] [REAL] NULL,
	[septal_surface_area] [REAL] NULL,
	[septal_surface_area_percent] [REAL] NULL,
	[right_pvs_enhanced] [REAL] NULL,
	[right_pvs_percent_of_total_enhanced] [REAL] NULL,
	[right_pvs_region_enhanced] [REAL] NULL,
	[right_pvs_volume] [REAL] NULL,
	[right_pvs_volume_percent] [REAL] NULL,
	[right_pvs_surface_area] [REAL] NULL,
	[right_pvs_surface_area_percent] [REAL] NULL,
	[left_pvs_enhanced] [REAL] NULL,
	[left_pvs_percent_of_total_enhanced] [REAL] NULL,
	[left_pvs_region_enhanced] [REAL] NULL,
	[left_pvs_volume] [REAL] NULL,
	[left_pvs_volume_percent] [REAL] NULL,
	[left_pvs_surface_area] [REAL] NULL,
	[left_pvs_surface_area_percent] [REAL] NULL,
	[laa_enhanced] [REAL] NULL,
	[laa_percent_of_total_enhanced] [REAL] NULL,
	[laa_region_enhanced] [REAL] NULL,
	[laa_volume] [REAL] NULL,
	[laa_volume_percent] [REAL] NULL,
	[laa_surface_area] [REAL] NULL,
	[laa_surface_area_percent] [REAL] NULL,
	[total_enhanced] [REAL] NULL,
	[total_percent_of_total_enhanced] [REAL] NULL,
	[total_volume] [REAL] NULL,
	[total_volume_percent] [REAL] NULL,
	[total_surface_area] [REAL] NULL,
	[total_surface_area_percent] [REAL] NULL,
	[residual_fibrosis] [REAL] NULL
) 
  
CREATE TABLE [dbo].[FEB_082021_DEMRI_Preablation](
	[document_number] [INT] NULL,
	[patient_name] [VARCHAR](255) NULL,
	[patient_mrn] [VARCHAR](255) NULL,
	[date_of_report] [DATE] NULL,
	[date_of_mri] [DATE] NULL,
	[provider] [VARCHAR](255) NULL,
	[processing_type] [VARCHAR](255) NULL,
	[la_enhancement] [REAL] NULL,
	[la_volume] [REAL] NULL,
	[utah_classification] [REAL] NULL,
	[mri_quality] [VARCHAR](255) NULL,
	[number_of_right_pvs] [REAL] NULL,
	[number_of_left_pvs] [REAL] NULL,
	[la_volume_index] [NVARCHAR](50) NULL,
	[la_surface_area] [REAL] NULL,
	[patient_height] [REAL] NULL,
	[patient_weight] [REAL] NULL,
	[bmi] [NVARCHAR](50) NULL,
	[gender] [VARCHAR](50) NULL,
	[dob] [VARCHAR](255) NULL,
	[posterior_enhanced] [REAL] NULL,
	[posterior_percent_of_total_enhanced] [REAL] NULL,
	[posterior_region_enhanced] [REAL] NULL,
	[posterior_volume] [REAL] NULL,
	[posterior_volume_percent] [REAL] NULL,
	[posterior_surface_area] [REAL] NULL,
	[posterior_surface_area_percent] [REAL] NULL,
	[anterior_enhanced] [REAL] NULL,
	[anterior_percent_of_total_enhanced] [REAL] NULL,
	[anterior_region_enhanced] [REAL] NULL,
	[anterior_volume] [REAL] NULL,
	[anterior_volume_percent] [REAL] NULL,
	[anterior_surface_area] [REAL] NULL,
	[anterior_surface_area_percent] [REAL] NULL,
	[lateral_enhanced] [REAL] NULL,
	[lateral_percent_of_total_enhanced] [REAL] NULL,
	[lateral_region_enhanced] [REAL] NULL,
	[lateral_volume] [REAL] NULL,
	[lateral_volume_percent] [REAL] NULL,
	[lateral_surface_area] [REAL] NULL,
	[lateral_surface_area_percent] [REAL] NULL,
	[septal_enhanced] [REAL] NULL,
	[septal_percent_of_total_enhanced] [REAL] NULL,
	[septal_region_enhanced] [REAL] NULL,
	[septal_volume] [REAL] NULL,
	[septal_volume_percent] [REAL] NULL,
	[septal_surface_area] [REAL] NULL,
	[septal_surface_area_percent] [REAL] NULL,
	[right_pvs_enhanced] [REAL] NULL,
	[right_pvs_percent_of_total_enhanced] [REAL] NULL,
	[right_pvs_region_enhanced] [REAL] NULL,
	[right_pvs_volume] [REAL] NULL,
	[right_pvs_volume_percent] [REAL] NULL,
	[right_pvs_surface_area] [REAL] NULL,
	[right_pvs_surface_area_percent] [REAL] NULL,
	[left_pvs_enhanced] [REAL] NULL,
	[left_pvs_percent_of_total_enhanced] [REAL] NULL,
	[left_pvs_region_enhanced] [REAL] NULL,
	[left_pvs_volume] [REAL] NULL,
	[left_pvs_volume_percent] [REAL] NULL,
	[left_pvs_surface_area] [REAL] NULL,
	[left_pvs_surface_area_percent] [REAL] NULL,
	[laa_enhanced] [REAL] NULL,
	[laa_percent_of_total_enhanced] [REAL] NULL,
	[laa_region_enhanced] [REAL] NULL,
	[laa_volume] [REAL] NULL,
	[laa_volume_percent] [REAL] NULL,
	[laa_surface_area] [REAL] NULL,
	[laa_surface_area_percent] [REAL] NULL,
	[total_enhanced] [REAL] NULL,
	[total_percent_of_total_enhanced] [REAL] NULL,
	[total_volume] [REAL] NULL,
	[total_volume_percent] [REAL] NULL,
	[total_surface_area] [REAL] NULL,
	[total_surface_area_percent] [REAL] NULL
)

------------------------------

INSERT INTO [dbo].[FEB_082021_DEMRI_Postablation]
           ([document_number]
           ,[patient_name]
           ,[patient_mrn]
           ,[date_of_report]
           ,[date_of_mri]
           ,[provider]
           ,[processing_type]
           ,[la_enhancement]
           ,[la_volume]
           ,[utah_classification]
           ,[mri_quality]
           ,[number_of_right_pvs]
           ,[number_of_left_pvs]
           ,[la_volume_index]
           ,[la_surface_area]
           ,[patient_height]
           ,[patient_weight]
           ,[bmi]
           ,[gender]
           ,[dob]
           ,[posterior_enhanced]
           ,[posterior_percent_of_total_enhanced]
           ,[posterior_region_enhanced]
           ,[posterior_volume]
           ,[posterior_volume_percent]
           ,[posterior_surface_area]
           ,[posterior_surface_area_percent]
           ,[anterior_enhanced]
           ,[anterior_percent_of_total_enhanced]
           ,[anterior_region_enhanced]
           ,[anterior_volume]
           ,[anterior_volume_percent]
           ,[anterior_surface_area]
           ,[anterior_surface_area_percent]
           ,[lateral_enhanced]
           ,[lateral_percent_of_total_enhanced]
           ,[lateral_region_enhanced]
           ,[lateral_volume]
           ,[lateral_volume_percent]
           ,[lateral_surface_area]
           ,[lateral_surface_area_percent]
           ,[septal_enhanced]
           ,[septal_percent_of_total_enhanced]
           ,[septal_region_enhanced]
           ,[septal_volume]
           ,[septal_volume_percent]
           ,[septal_surface_area]
           ,[septal_surface_area_percent]
           ,[right_pvs_enhanced]
           ,[right_pvs_percent_of_total_enhanced]
           ,[right_pvs_region_enhanced]
           ,[right_pvs_volume]
           ,[right_pvs_volume_percent]
           ,[right_pvs_surface_area]
           ,[right_pvs_surface_area_percent]
           ,[left_pvs_enhanced]
           ,[left_pvs_percent_of_total_enhanced]
           ,[left_pvs_region_enhanced]
           ,[left_pvs_volume]
           ,[left_pvs_volume_percent]
           ,[left_pvs_surface_area]
           ,[left_pvs_surface_area_percent]
           ,[laa_enhanced]
           ,[laa_percent_of_total_enhanced]
           ,[laa_region_enhanced]
           ,[laa_volume]
           ,[laa_volume_percent]
           ,[laa_surface_area]
           ,[laa_surface_area_percent]
           ,[total_enhanced]
           ,[total_percent_of_total_enhanced]
           ,[total_volume]
           ,[total_volume_percent]
           ,[total_surface_area]
           ,[total_surface_area_percent]
           ,[residual_fibrosis])
		   SELECT
   [document_number]
           ,[patient_name]
           ,[patient_mrn]
           ,[date_of_report]
           ,[date_of_mri]
           ,[provider]
           ,[processing_type]
           ,[la_enhancement]
           ,[la_volume]
           ,[utah_classification]
           ,[mri_quality]
           ,[number_of_right_pvs]
           ,[number_of_left_pvs]
           ,[la_volume_index]
           ,[la_surface_area]
           ,[patient_height]
           ,[patient_weight]
           ,[bmi]
           ,[gender]
           ,[dob]
           ,[posterior_enhanced]
           ,[posterior_percent_of_total_enhanced]
           ,[posterior_region_enhanced]
           ,[posterior_volume]
           ,[posterior_volume_percent]
           ,[posterior_surface_area]
           ,[posterior_surface_area_percent]
           ,[anterior_enhanced]
           ,[anterior_percent_of_total_enhanced]
           ,[anterior_region_enhanced]
           ,[anterior_volume]
           ,[anterior_volume_percent]
           ,[anterior_surface_area]
           ,[anterior_surface_area_percent]
           ,[lateral_enhanced]
           ,[lateral_percent_of_total_enhanced]
           ,[lateral_region_enhanced]
           ,[lateral_volume]
           ,[lateral_volume_percent]
           ,[lateral_surface_area]
           ,[lateral_surface_area_percent]
           ,[septal_enhanced]
           ,[septal_percent_of_total_enhanced]
           ,[septal_region_enhanced]
           ,[septal_volume]
           ,[septal_volume_percent]
           ,[septal_surface_area]
           ,[septal_surface_area_percent]
           ,[right_pvs_enhanced]
           ,[right_pvs_percent_of_total_enhanced]
           ,[right_pvs_region_enhanced]
           ,[right_pvs_volume]
           ,[right_pvs_volume_percent]
           ,[right_pvs_surface_area]
           ,[right_pvs_surface_area_percent]
           ,[left_pvs_enhanced]
           ,[left_pvs_percent_of_total_enhanced]
           ,[left_pvs_region_enhanced]
           ,[left_pvs_volume]
           ,[left_pvs_volume_percent]
           ,[left_pvs_surface_area]
           ,[left_pvs_surface_area_percent]
           ,[laa_enhanced]
           ,[laa_percent_of_total_enhanced]
           ,[laa_region_enhanced]
           ,[laa_volume]
           ,[laa_volume_percent]
           ,[laa_surface_area]
           ,[laa_surface_area_percent]
           ,[total_enhanced]
           ,[total_percent_of_total_enhanced]
           ,[total_volume]
           ,[total_volume_percent]
           ,[total_surface_area]
           ,[total_surface_area_percent]
           ,[residual_fibrosis]
		   FROM [dbo].[DEMRI_Postablation]
		   
		   
		   

INSERT INTO [dbo].[FEB_082021_DEMRI_Preablation]
           ([document_number]
           ,[patient_name]
           ,[patient_mrn]
           ,[date_of_report]
           ,[date_of_mri]
           ,[provider]
           ,[processing_type]
           ,[la_enhancement]
           ,[la_volume]
           ,[utah_classification]
           ,[mri_quality]
           ,[number_of_right_pvs]
           ,[number_of_left_pvs]
           ,[la_volume_index]
           ,[la_surface_area]
           ,[patient_height]
           ,[patient_weight]
           ,[bmi]
           ,[gender]
           ,[dob]
           ,[posterior_enhanced]
           ,[posterior_percent_of_total_enhanced]
           ,[posterior_region_enhanced]
           ,[posterior_volume]
           ,[posterior_volume_percent]
           ,[posterior_surface_area]
           ,[posterior_surface_area_percent]
           ,[anterior_enhanced]
           ,[anterior_percent_of_total_enhanced]
           ,[anterior_region_enhanced]
           ,[anterior_volume]
           ,[anterior_volume_percent]
           ,[anterior_surface_area]
           ,[anterior_surface_area_percent]
           ,[lateral_enhanced]
           ,[lateral_percent_of_total_enhanced]
           ,[lateral_region_enhanced]
           ,[lateral_volume]
           ,[lateral_volume_percent]
           ,[lateral_surface_area]
           ,[lateral_surface_area_percent]
           ,[septal_enhanced]
           ,[septal_percent_of_total_enhanced]
           ,[septal_region_enhanced]
           ,[septal_volume]
           ,[septal_volume_percent]
           ,[septal_surface_area]
           ,[septal_surface_area_percent]
           ,[right_pvs_enhanced]
           ,[right_pvs_percent_of_total_enhanced]
           ,[right_pvs_region_enhanced]
           ,[right_pvs_volume]
           ,[right_pvs_volume_percent]
           ,[right_pvs_surface_area]
           ,[right_pvs_surface_area_percent]
           ,[left_pvs_enhanced]
           ,[left_pvs_percent_of_total_enhanced]
           ,[left_pvs_region_enhanced]
           ,[left_pvs_volume]
           ,[left_pvs_volume_percent]
           ,[left_pvs_surface_area]
           ,[left_pvs_surface_area_percent]
           ,[laa_enhanced]
           ,[laa_percent_of_total_enhanced]
           ,[laa_region_enhanced]
           ,[laa_volume]
           ,[laa_volume_percent]
           ,[laa_surface_area]
           ,[laa_surface_area_percent]
           ,[total_enhanced]
           ,[total_percent_of_total_enhanced]
           ,[total_volume]
           ,[total_volume_percent]
           ,[total_surface_area]
           ,[total_surface_area_percent])
     SELECT
	 [document_number]
           ,[patient_name]
           ,[patient_mrn]
           ,[date_of_report]
           ,[date_of_mri]
           ,[provider]
           ,[processing_type]
           ,[la_enhancement]
           ,[la_volume]
           ,[utah_classification]
           ,[mri_quality]
           ,[number_of_right_pvs]
           ,[number_of_left_pvs]
           ,[la_volume_index]
           ,[la_surface_area]
           ,[patient_height]
           ,[patient_weight]
           ,[bmi]
           ,[gender]
           ,[dob]
           ,[posterior_enhanced]
           ,[posterior_percent_of_total_enhanced]
           ,[posterior_region_enhanced]
           ,[posterior_volume]
           ,[posterior_volume_percent]
           ,[posterior_surface_area]
           ,[posterior_surface_area_percent]
           ,[anterior_enhanced]
           ,[anterior_percent_of_total_enhanced]
           ,[anterior_region_enhanced]
           ,[anterior_volume]
           ,[anterior_volume_percent]
           ,[anterior_surface_area]
           ,[anterior_surface_area_percent]
           ,[lateral_enhanced]
           ,[lateral_percent_of_total_enhanced]
           ,[lateral_region_enhanced]
           ,[lateral_volume]
           ,[lateral_volume_percent]
           ,[lateral_surface_area]
           ,[lateral_surface_area_percent]
           ,[septal_enhanced]
           ,[septal_percent_of_total_enhanced]
           ,[septal_region_enhanced]
           ,[septal_volume]
           ,[septal_volume_percent]
           ,[septal_surface_area]
           ,[septal_surface_area_percent]
           ,[right_pvs_enhanced]
           ,[right_pvs_percent_of_total_enhanced]
           ,[right_pvs_region_enhanced]
           ,[right_pvs_volume]
           ,[right_pvs_volume_percent]
           ,[right_pvs_surface_area]
           ,[right_pvs_surface_area_percent]
           ,[left_pvs_enhanced]
           ,[left_pvs_percent_of_total_enhanced]
           ,[left_pvs_region_enhanced]
           ,[left_pvs_volume]
           ,[left_pvs_volume_percent]
           ,[left_pvs_surface_area]
           ,[left_pvs_surface_area_percent]
           ,[laa_enhanced]
           ,[laa_percent_of_total_enhanced]
           ,[laa_region_enhanced]
           ,[laa_volume]
           ,[laa_volume_percent]
           ,[laa_surface_area]
           ,[laa_surface_area_percent]
           ,[total_enhanced]
           ,[total_percent_of_total_enhanced]
           ,[total_volume]
           ,[total_volume_percent]
           ,[total_surface_area]
           ,[total_surface_area_percent]
		   FROM [dbo].[DEMRI_Preablation]


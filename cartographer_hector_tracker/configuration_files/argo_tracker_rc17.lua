-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.


include "map_builder.lua"
include "trajectory_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "world",
  tracking_frame = "base_link",
  published_frame = "odom",
  -- published_pointcloud_frame = "spin_lidar_lidar_mount_link_fixed",
  odom_frame = "odom",
  provide_odom_frame = false,  
  publish_frame_projected_to_2d = false,  
  use_pose_extrapolator = true,
  use_odometry = false,  
  use_nav_sat = false,
  use_landmarks = false,
  num_laser_scans = 0,  
  num_multi_echo_laser_scans = 0,
  num_subdivisions_per_laser_scan = 1,
  num_point_clouds = 1,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 0.1,
  pose_publish_period_sec = 5e-3,    
  trajectory_publish_period_sec = 30e-3,
  rangefinder_sampling_ratio = 1.,
  odometry_sampling_ratio = 1.,
  fixed_frame_pose_sampling_ratio = 1.,
  imu_sampling_ratio = 1.,
  landmarks_sampling_ratio = 1.,
}

TRAJECTORY_BUILDER_3D.num_accumulated_range_data = 8
TRAJECTORY_BUILDER_3D.min_range = 0.3
TRAJECTORY_BUILDER_3D.max_range = 40
TRAJECTORY_BUILDER_3D.ceres_scan_matcher.ceres_solver_options.max_num_iterations = 200
TRAJECTORY_BUILDER_3D.ceres_scan_matcher.rotation_weight = 5
TRAJECTORY_BUILDER_3D.voxel_filter_size = 0.05
TRAJECTORY_BUILDER_3D.submaps.high_resolution = 0.05

MAP_BUILDER.use_trajectory_builder_3d = true
MAP_BUILDER.num_background_threads = 3

TRAJECTORY_BUILDER_3D.submaps.num_range_data = 240000
POSE_GRAPH.constraint_builder.sampling_ratio = 1
POSE_GRAPH.global_sampling_ratio = 1
POSE_GRAPH.optimize_every_n_nodes = 24
POSE_GRAPH.constraint_builder.min_score = 0.6
POSE_GRAPH.log_residual_histograms = false


--TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.scans_per_map_update = 1
--TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.scans_per_optimization_update = 1

TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.high_resolution_grid_weight = 10.
TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.low_resolution_grid_weight = 30.
TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.velocity_weight = 8e1
TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.translation_weight = 1e3
TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.rotation_weight = 2e2
TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.odometry_translation_weight = 1e2
TRAJECTORY_BUILDER_3D.optimizing_local_trajectory_builder.odometry_rotation_weight = 1e2


return options
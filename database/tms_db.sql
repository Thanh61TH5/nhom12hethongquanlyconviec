SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `tms_db`
--

-- --------------------------------------------------------

--
-- Bảng danh sách dự án
--

CREATE TABLE `project_list` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `manager_id` int(30) NOT NULL,
  `user_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Thêm dữ liệu vào bảng dự án
--

INSERT INTO `project_list` (`id`, `name`, `description`, `status`, `start_date`, `end_date`, `manager_id`, `user_ids`, `date_created`) VALUES
(1, 'Bài tập lớn', '								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Tạo trang web quản lý công việc&lt;/span&gt;							', 0, '2021-10-31', '2021-11-11', 2, '3,4,5', '2021-10-31 09:56:56'),
(2, 'Test 1', 'Mô tả ở đây', 0, '2021-10-31', '2021-11-11', 2, '3', '2021-10-31 13:51:54'),
(3, 'Hahaha', 'fghj', 0, '2021-10-31', '2021-11-11', 2, '4', '2021-10-31 14:34:42');

-- --------------------------------------------------------

--
-- Bảng thông tin hệ thống
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Thêm dữ liệu vào bảng thông tin hệ thống
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Hệ thống quản lý công việc', 'raito12st@gmail.com', '+123 456 78', 'Bla bla bla', '');

-- --------------------------------------------------------

--
-- Bảng danh sách nhiệm vụ
--

CREATE TABLE `task_list` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Thêm dữ liệu vào bảng danh sách nhiệm vụ
--

INSERT INTO `task_list` (`id`, `project_id`, `task`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Thiết kế CSDL', '								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Tạo nhiều bảng&lt;/span&gt;													', 3, '2020-12-03 11:08:58'),
(2, 1, 'Thiết kế giao diện', 'Sử dụng HTML và PHP							', 1, '2021-10-31 13:50:15'),
(3, 2, 'Task Test', 'Haha', 1, '2021-10-31 13:52:25'),
(4, 2, 'haha', 'Bla bla', 1, '2020-10-31 13:52:40');

-- --------------------------------------------------------

--
-- Bảng danh sách người dùng
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = p.manager, 3 = employee',
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Thêm dữ liệu vào bảng danh sách người dùng
--

--
-- Bảng tiến độ
--

CREATE TABLE `user_productivity` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` int(30) NOT NULL,
  `time_rendered` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Thêm dữ liệu vào bảng tiến độ
--

INSERT INTO `user_productivity` (`id`, `project_id`, `task_id`, `comment`, `subject`, `date`, `start_time`, `end_time`, `user_id`, `time_rendered`, `date_created`) VALUES
(1, 1, 1, '							Tạo bảng 1                      ', 'Thiết kế bảng', '2021-11-01', '08:00:00', '10:00:00', 1, 2, '2021-31-10 12:13:28'),
(2, 1, 1, '							Tạo bảng 2						', 'Thiết kế bảng', '2021-11-01', '13:00:00', '14:00:00', 1, 1, '2021-31-10 13:48:28'),
(3, 1, 2, '							Tạo trang login					', 'Test', '2021-11-01', '08:00:00', '09:00:00', 5, 1, '2021-10-31 13:57:22'),
(4, 1, 2, 'hahaha', 'Test', '2021-11-01', '08:00:00', '10:00:00', 2, 2, '2021-10-31 14:36:30');

--
-- Thông báo dự án mới
--

CREATE TABLE `users_notifications` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `project_name` varchar(200) NOT NULL,
  `user_id` int(30) NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users_notifications` (`id`, `project_id`, `project_name`, `user_id`, `status`) VALUES
(1, 1, 'Bài tập lớn', 1, 0),
(2, 2, 'Test1', 1, 0);


ALTER TABLE `project_list`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_productivity`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Tự động tăng thứ tự trong các bảng
--
ALTER TABLE `project_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `task_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `user_productivity`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `users_notifications`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;
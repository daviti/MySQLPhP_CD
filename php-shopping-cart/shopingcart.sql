
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(60) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_desc` tinytext NOT NULL,
  `product_img_name` varchar(60) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_code` (`product_code`)
) AUTO_INCREMENT=1 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_desc`, `product_img_name`, `price`) VALUES
(1, 'PD1001', 'Android Phone FX1', 'The LG Optimus F5 and Optimus F7 were announced back in February. The former becomes Verizon’s Lucid 2 and the latter is expected to head to the Boost Mobile as the LG FX1. This would be carrier’s third LTE-capable smartphone after the ZTE Force and HTC One SV.', 'android-phone.jpg', 200.50),
(2, 'PD1002', 'Television ', 'Television, colloquially known as TV, (from French télévision; from Ancient Greek τῆλε (tèle), meaning "far", and Latin visio, meaning "sight") is a telecommunication medium that is used for transmitting and receiving moving images and sound. In a broader sense, television can also refer to images that are monochrome (black-and-white) or color, or images with or without accompanying sound. Television may also refer specifically to a television set, television program, or television transmission.

.', 'lcd-tv.jpg', 500.85),
(3, 'PD1003', 'External Hard Disk', 'Save your files quickly with this WD My Passport Ultra external hard drive, which features a USB 3.0 interface for transmitting data at up to 480 Mbps. The 1TB capacity offers ample space for data backup and file storage.
', 'external-hard-disk.jpg', 100.00),
(4, 'PD1004', 'Wrist Watch GE2', 'Invicta Men 8928OB Pro Diver 23k Gold Plating and Stainless Steel Two Tone Automatic Watch.', 'wrist-watch.jpg', 400.30);

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Book Shopping Portal</title>
<style>

* {box-sizing: border-box;}
body {
	font-family: Verdana, sans-serif;
	padding-top:15px;
}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 800px;
  max-height:400px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
	
  color: #f2f2f2;
  font-size: 25px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px;}
}

/* Next & previous buttons */
.prev,
.next {
	cursor: pointer;
	position: absolute;
	top: 60%;
	width: auto;
	padding: 16px;
	margin-top: -50px;
	color: white;
	font-weight: bold;
	font-size: 20px;
	border:0;
	background-color:transparent;
	user-select: none;
	-webkit-user-select: none;
	transition: 0.6s ease;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}
</style>
</head>
<body>
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 6</div>
  <img src="https://img.theculturetrip.com/wp-content/uploads/2016/12/cover-banners-2.png" style="width:100%">
  <div class="text"><mark style="background-color: rgba(0, 0, 0,0.7); color: white;">Crime and Punishment</mark></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 6</div>
  <img src="https://stylecaster.com/wp-content/uploads/2021/06/Harry-Potter.jpeg" style="width:100%">
  <div class="text"><mark style="background-color: rgba(0, 0, 0,0.7); color: white;">Harry Potter</mark></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 6</div>
  <img src="https://deadline.com/wp-content/uploads/2021/09/pjimage-1-7.jpg" style="width:100%">
  <div class="text"><mark style="background-color: rgba(0, 0, 0,0.7); color: white;">All the Light We Cannot See</mark></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 6</div>
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ30jva6jgL_NqcfroeXvdZlPUGqvPE2FSigQ&usqp=CAU" style="width:100%">
  <div class="text"><mark style="background-color: rgba(0, 0, 0,0.7); color: white;">Anxious People</mark></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 6</div>
  <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUWFRgWFhYZGRgYHBoaGBoYGhgYGRwYGRoaGhgYGBgcIS4lHB4rIRoYJjgmKy8xNTU1GiQ7QDszPy40NTEBDAwMEA8QHxISHzQrJSs0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIAKgBKwMBIgACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAAFBgMEAAECB//EADoQAAIBAgQDBQcEAQMEAwAAAAECEQADBBIhMQVBUQYiYXGREzJCgaGxwVLR4fBiI4KSFHKy8Qcz0v/EABkBAAMBAQEAAAAAAAAAAAAAAAIDBAEABf/EACIRAAMBAAMBAAMBAQEBAAAAAAABAhEDITESMkFRIgSBE//aAAwDAQACEQMRAD8A8wUipNK6S0oqyHQcqAJA25b8KJcHaDUd28CIArnANDUNrZCjqhmbXKfEU78PwylFPhSJZMrT32cfOgHOkcX7kbzLxlm5bCiQKkwzyNoognDmO5UfWu1w1ld3JPQaCiUtrMEOkgXxWznssPChvALLFAApPLY8qZnxlpBok+dV340/wgD++EU9S87Fu0d2uGuYzCB4kCiycNtLuJ/7j+0Ut3OIufijy0qq99juSfMzWqTHY2G/hkMjID1UAt6gTUF3j9sbBm+UD60rF6jz1vyC7Yw3O0LH3UA8yT+1U7vGLp+OPIAfzQtTW2n03rcB+mTXMUze8xPmSajz1CASC3IQD89vtUvsTkDgzO45jWJrTOzTNUZNWWsjOq8mCnx1En81yjM8qMigkAAwN9o5k12nfJTutGvSoLzB9Klxadxh0B+mv4oRacjnSOXplfBP1Jl7hZGoqsltkOootbxXWrYdGHKg+hjhoq4PiS7Gpb9xTqKGYnC96VqLI8gAEk7AAknyFZ86cq+GEb1rShN1TNM/DOA4lwC4Ftf8/e/4D8xTFgOzNkEEobhHN4y/8dvWaOZaAq02JPDMG90QiM3kNPm2wpgw3Y9mg3XCj9Kd4+p0H1ptvYqzaEM6iPhT9htQnE9o40toB4tqfSjUgPkwtYDs5YtaqgkfG/eP12qxieJYe3u2Yjkuv8Uq4riN1/fcnw2HpVNjRKRTsN8Q7QlxlVEA/wAgGP10FA72IZtzp02HyA0rS2yduhPyHSthANTroDHKSY18KPpAvWBuLGAp8fxQxYO9GeOJC8twdNtQdqBEmlV6U8X4mrixThfwiE+6uyj3AdlA6Ul3NqcMXYXNqinupyn4F8K5HMCp2YQrJ3oNe7OsHIB0poXGlhlWhmPw2IBlNZ5VPx8iXVMbyQ/Qfa4GFUydaBNh2R9RpNNuAsMB3zrUPGsKCulbXMt+UbHA8+mVcE0imvstfglfGlDBAijGAuFGkGKWqytDufqcPT0bSgt9YcjzirXBsXntoecanxBg1HxRIeeo/irYZ53IsKuJbup5E/WqparWJgiSCcuVYBjlP3mq99ApEAiQCQeXhTG+wUjkGtpbLTsANydBVnE7HvnqFAMddeVRZCyADXKSSPPY1h2ET29QAQ07R410wRTlIJjQtMa84FaZGWGiNdJ8NakFtGObPAOpEHN5DlXHHWHt5bkbwCR490kVIAAP8XIHygyPkYqNr/eLAbggDoIgVVJO1YamkTWrcB1PQH/if5rtXyopG4LCOoMGCOlR5ydSdTvXDitM06xN5cyFPhA35EHapFxCjVUAbrJIE7kDrVMisBrsO1mOkyOtLpamRTQDEpDMOhP3pHMvGV/8j9RB7Q1OjGoglTAUgtYT4GivdVHmCDsY1AkCaesLYRBCIF6ke8fNt6QuFIVuI/RhPkdD96fc1Njwk5/ejnH8R9msqgJmJYz9KBYri91/ecgdF7o+lEuKrKHwg/WgVu3O5jWNidTT5zCWt04BraoTsJjepLSjKT3ZBiTPTkK2bbMq5RIgz0mTM/KK3QcOFtDSTBbYR9+ldWkEAnoZ+ZyitB10YkyvKN421qs1yY8P3muOWIl2A1ggMPnUT39ZAG0EHbrWNrUZFdh2lHixLIxPUfeKAmmPiCf6beX5pemgpdjeN9ELmnXE4sZvi2X4X/SPEf3rvSZFNL8YtmDlfZR8PJQPxWLoN9g3h15U33FEm4oOlL2IxyAk1WfiJPu1B/8ANv8ARZmhrF4rNtpVC/ilA7zUPdnbnVXEYQ8zRzxf0LteF0Y1CYFW1JI0oBhEhqO4Y7VrlTSO7+WOXYy4crJpo0+MMI0PmJ+dH+JpKg9DHrSv2dUq4J2II668j603YlcyHymrJPNtegW0+rDNlkCDMbVziHXKFDZjJJOseQmqt/3q0KaK3ounECB3ATAEknl4CqquQZBjy0rQrIrDtMdiTJJPnrQDjPaRLEovffmAdF/7j18Ki7U8c9mPZWz3yO8w+BT0/wAj9KQnMmuDmd7YebtdiCZ7kdMp+81OnbK7m1RCOQkg+vP0pbWwx2FdHDsNxFDofwv4OmC7ZoTFxCo6rrHy3plwuMS6uZHDDw+xHKvI2SKIcI4m+HfOh0+JeTDx8fGiTBcfw9Ry1mWo8DikuIroZVhI8OoPiKtRWiyJUoJxJIdvGD9BTBFBeNEK4J5r9if3pXKtkf8A81qa7/hQVjtU6uIqg+M6CuVedzSFL/ZVXMv0Ehj8u1Ps5gjAE6A6fIjl415th7es716Dwxw1pJ5CIHhIpkrCfkbrstY1ZRh4GgGHeAe9l1GsSecxTG2q9ZFK76EimIS+iQ3RLd0QTInlv086hmsFDePY/wBjZZh7x7qf9x5/ISflRArsB9puPlSbVowR77Dkf0j8mllcbc/W/wDyNaw9hrjhRqT1+pNGL/BMq+POl1aT7KY4tXRzwjtA6MFdiyE6zqR4g08oQRI2Oory7EWyrQad+zHEA1lUYmV7ux2+GTRSxdxgZdAQQdqFYvCqdqL3F0PkaEKjDnWV6ZHhUt4dR71WgqVK1hTqd61/0ooGw0Kz4MlZqNQcmm4p3scNEQaoWeHKrkEaGuuk51FULKz+gjhllnXai6cKEa1fSwLZ0GlXEYMNKkq3+iuZ6xitj+HhNQKistqKYeJYeVNLa7kdK7dRlJDvw1u4CN9KZrBlfp+9KHZ+5KCmrBHu8/pHy6VXD1Hlck5TF/FpDmuctXeKpDk9dfWqtPROzQFQY/Ei2judlBPz5CrApb7c3Isos7uCR10MfY/StNXbEnFXGdi7GWYkk+JrfC8GbtwIPnW3IyjwH1P9HpTF2GsAvcPNY+s0u6+ZbKYnawM2eDIg0UT1qljuFrrpTU6GNdKE8RvIil3aAPUnkAOtQ/T0sWYJHFOHlRmFBwdaasTeziWdUB922RJI5Zm5E+FK+Jt5WI6VZxt5jJuSVuobOxnFMma0ZMnMoEHfQwCfLanXD4lXkQQRuGEGvHTyps7IcQYXCjuTp3ZM9JEnwA9KbpNU/sezQLtOndtnxI9QD+KPUP4xbDJryYH8fmsrwGfyFfCWSWGmlMC4JDGlawdoAbVcBqeqKUji3hVHKjvC37jDof560GmiPB37zDqK6X2dS/yGrZlR/P5pdxiQ7DxNMNhpX9ySfrQPiqxcPiAachD8KlJ3bLEFriJyVSx8S3/r603k0gdqmP8A1LeSx5R+80TOj0t9jsOC7udcoAHz/wDVH+KFUUltAOXMnkB40s9nsVkS60kTlAy+8WMwAeVXzZd7Ae5IGcHvEklT1J1qO1tay+Hk4gDxWGOYEHkY5eBPOoMDeKOrAncbcxO1G+NYG2lkZI1IM9aAYcAsJMU6GmuhPIsfZ6krSoPUVRvWNdKtWCMixtAq3kt/qJ8loreYJhboKt4VtyYFXhg/Gp2a3oMradTFFrFyxlEtB9aVrfo1pLwCe3iq+KmQ0VYe0SwgVcfCymtbEpwN5K+WmiulsMutDcZba33l1HSr2FO69KmuIpEGo0/l4W/ktBuF4olxY50vY9Mj+BqfjWF9m2dD8hQ69dd4JFO+U1qE1ePGHeD40Joab+CYwOW6iPQ+PyrzzDuFImmLszxJDiFSffBA8SozD7Gi46aaQjmhNOho4ymgPyoYuwo5xBJQ+Gv4oEnMVbPh59em4pS7dJItt0zKfnBX7Gmq9cCqWOwBPpXm/aDiLXXme6Nh+Y9a1nR6Cc3KmTsdeIa73sggFm5gCdp0nalvId6YuxIVrlxHAIdNQeYB1+4pXJ+LKeP8iXHcVD3AUN1wNZLtrG+VZ73kBV/j2Fc27bn/AHDkGjuk+HWj2Jw1nDW2uZFGRTAAAJ6KPnVfiuKRrJDkliARlViJjlUrrtNIqSfjAlnsyjHOSSDlMTOw1ltzJ15cqB9psLkcEbbftRLDcTuWtSGyH4WMkeI/ahnHMQbhB6kROm/PypsuvrsC5lS8A+aivZ9W9smm5EeIDCSPKDQkUS4VjGR0bN7nuK0lSGPeUa93cmqESvw9VG1Q41MyMPD7a/isw1wMoIOld3RII6gita6Ep9g+1AFdMedDcNiWjUVfs3ZqRotT0mS5NXeFvDjxkfmqQqbCtDqfEVy9Oa1DRZUga/k/PWhHGl7ynqPt/wC6L2qHcbXuqeh+4/inz6TPwX8diAiM5+ET8+Vea4u8bjs5MyZ/im3tdiAUVAfi70eA0BpOIAFEzYX7GbsU6zcDR8J1+dFsQ73bb5AIZiF0loBgZR8qA9mFD271sDv6Ojcxyyn/ABMD1ozaxhs2VCr3nGsEGDtBPTwqWkvoth/5WCxxDMgZG+EwBM+dDrc5hG5Ijzq1xRyXg77nzNa4Qma9bH+Q+mtOldCbfY/cIt3PZDOuo+1XUSrh0HQCPSK5TEW0QE7kbc6Hlr5nQOKfqiS7wsgK36qiyIPiFFsLe9vYZSCpG34oUOAjqal5LfWFPHKW6bwrzV17ygamlU8RI2qjiuL9W9Kpq1+gKl0E8TisrnLVO7j2POKCXuKE+7VN7rtuYpTh09HTbmfnQticYvxGao3MfOiiqoQczNdlgNqOYAdr9mZWbc1a4ddFu6j/AKGUnynvfSapf9UAKqviSdqYpE1e+HvTDMpHUfcUtnRjV3sljDdwtpyZOUKT4r3T9Qar8Stw5H911ps+kloWO2OKZUVEPvnXyA29dflSIUJknz9edN3afDuUkksV2IEEDbUeRMxSgXO390o2Fx+GXWMAcqOdisKXvNlcK6pmRTs4kBlnkfdNL7mrXB8X7K8jyYVtfI91j6H6UulqaGy8aY2cQxT3rgtMCMjDOpgHTUDpB60xome2uci3I0VRmfb3Sdljw9aG8awqFlvQWe3BOU5S9uZiev5FUsfjyy57bOo8ZUx/kBzqVZ/CvtlbtDZtKVVF2MyzZmOhGoGg66filbiF2SB+kD1gD++dFsVdRQSWlunOaXmMkmnx32K5HnSMBohwTBG9dVAYkEyRI0E7c6HU19grM3HaPdA16Tm+/wCKaien0NnBODtaWM+h1KwcoM7oJOUdRMaaVfvIVgnUHYirpLZ4EAZRBPTnEc9vSquIEIQTMtp5a6j+9K7RTX7Fy2AHcdGP30q2kcqG8QJW63jB+g/M1zh7zKddqRU9lM10g0tT4VMzAbcyegGpNUUuTtRCy2W1cfmwFsf7tT9BQqexjrF0MNhpynw8dZ8vzUfF0lD4EH8fmouHuDbQ+ED5aVbx6yjeX21p0kzEDtDw4OjNMEAttvHI0h/avQ+0DsLDhdyI3jQ7x8qSeF4PO4nb7mtp52bxJvok4Dea3ckfECp8jFF8ShIY91dS2uzdY6Gt4qypIAI000qvj1LIAW93l1jmTSGvp6VpqZwovhUdSyyrecg+tQ8IYo63AJKnQQYPUSNjRLhdsQx3gHypl7P2ALSgqI1IOhmTM0yN1oVyNYmXVd2tkvAJAIA6bwTV/hWCV1DkSdvrWmtyp8jV/s/Hs46E0H/QtgHheV/4EMNaCkaaVdbCKdetVWeo2xcc6iikumiik32jxZ8U7eFQkDmaju3Sars1XqEhT5GW/agbV0MR1qh7StA0fyLdNlu5fqJ7hNRgVNbtV3SOzThLZNTraip7NszV5MLQugphscP/AI7xPce3+lgRvs46ean1o7xlNQeo+39FK3ZJsl8AbOCp25ajfyPrTlxVJSeh+9FNdieWfnoBuBGsbc68q4gVFxwpBUMwWNBGY7eFel4t4Q6weRidfLnXmOJw7I5U6mdxsT4U2gOP1kSHWAJmrS8OuAZimnWiPC8AAQWgt9quY7FfBNTVyd4iyOJZrJcFiGdMjMZCgCN4Hh8Q8N6sXbEjK7FFYd11Ig+f9FBVzCCu6mQa6x+Ie4urgDcrHPnr40vOxu4jDiFDFGy3F2kgH0Nc4nhdt1zW+6d45fxQpG1g/wB+dMPDQMpJOw2o3s9oBZXTFZUJkAbST4Ab0z9neIjDF9riORBRlDSND3GI08+la4AmHbEOboXvAZAw7pYnUDlm0HrTdb4Dh5zBANZgTEjw2HyqifNJLePC7gOIO5E22VY3bQzpAAB1Gp102rjFu2chj5dIq+um3l6VV4kuit8jWoVQvcVXvqeoj0P813hlBGtb4p7qnxI9R/FVrZalUuyiH/lF1Ug6USxCH2dpBMtmcx/xWt8N7P3bi5/cQc23PkKdODYBVZnIHcVEUnllEsR01P0rJlmOv0A+HYV0thXUqdxInQ+FEWWVjqKu8YuKxUqZiQY+W3oapqZH770WYwH2JXEEBWSCcs6Dw8OdLVuyFRnEiSSI8aaeLd32g6ZvzVK3h19iBzIoeWswdwTuiS95uuo51u7iGKwd+tEcZgSzqiL3mMDkJ86IcJ4Ajscz50VWBYBkGcHUJ+sAA61k9h1/l4VOz2Ddkdj3Ug95tumg3NMvZ2Bat6zKk69ZIirGIuIgChiilAqwJOnIDkYBoN2cxhZDa0hGOU/EQSSJNEljAruRpT3SDyqfgTAq8cm/FCs5WQeVWey96WuDlIIrOaXUNICK+a1h7OdooLir3fbzo9cYAE7UKs2pEnnJ+pqTjhpvUUPkX6PFWuGuQDVkYU1OmH20q36QpQyvawrGrNvh550QtLFSTS3QyeNfsqpggBVi1h1rHUmrmGKquu9C6GzH8RHatKK7atZxNdMKDsdiSwsYTEZHVv0kE+U6j0r0a+MyEf4z6a15cDXo/AL4ewhO4UAz1Gh+1Nhkn/TKxNADE2laVYSKVeMlGcKqwUJG0QT/AO6b8YmVyOhIpbxtoviCvQKPpP5p3JWSTcE7fYGxdoqsh4NDixIIbXx5064/hKhflS1icBlqeX/SylvgNtYl0MbirLXww00NU7hynWu7K5yoTVmIUCRqzGFEnTUnemOV6Aqa6KjnWmvgqgptqVqDhPZO7duZbgNtAXBOhYsk6KOkj3tuYmm7h2Ct2hcVAi5CkFwzwjIRoNZYujHUczXXLaBm0mwD2Rbv3UKyFhgYkKZK78icw9DTjhxIPgCfqKUuzrkYzEIDmzo5EDLmZHVlIXlpm0putDIYfSVMxBIkHeOdMh9CORf6JcOZYjTYxOoBiZio+I6pvOm8ZdugrEuKHlZ0/VGukbCt4lyw5bHQADfyoxb8BWH4e+IZbaRmJkTtoDJ9Jp44R2Xs2QCw9o4+Jtgf8VpQ7P4jJiLbcs0HyYFfzXpFjFKdJidpoaS0KH0ZiMNKwN/p5UJ4liGtoQq5jPnqegFG8Q8KfSlniPEVtkgEzGunM8geVYzX7hVwntCSzmNNF5+Z6VbttIoVhOJu7gaBZ1H80SsDU7/j5UGpvo7Gha45al3H6h9xVTh2FOVGc9zvZhtlyyBPmR9KMcct98Hqv2NQXMOLluJKkrlJHMTOorbn6xjeKvnUBsmVk0kpedSOcOkEj70QyIgVLYICiNfGt4PhWVi7Pnc7EiOUevjV32YCehmOc9aGViDuk2Bsfh+/ZVh3WYk+WU6feswdm2jBVg5JzRuQ8upPXpRbFYcuAx7oRiQxBJIggwOe9BrfEbVlsiIBMFpjO/TM3wit/YLezgPxvFy91UClQDLSCJA2gHl40f7NoVLMdAw50Fu3Ge9nVQ5k5NNAD+KcMDwt2Ie6Y00Qb+nKil70K5MXhxiHZ21Byjb9zUq2T0NELhRBynpyH71TONPWteIWopnlE1tBUaJrU46UjD0mzvLUy26isrG9drf1iuwF0yRgAK0BIrT6jQ1ltYFC0HFM0lvWpzURcCp0M7VgTxG0QU3dkb/cdDyOYeRG30PrSfh8Pdd8iIWPRRPr0p34J2fu2f8AUdhmiPZjWATqS3UeHjTJl7pPyckuflkPG7cPPWD/AH0pZuuEvljzAI9I/FOPH0lVbzH5H5pZxWANwd33wNAdJ8J602l9SS8VKb7LCXDchVEk7AUL/wCg9o+ScpKuRpMsqlgvhMUax11EuXrqnI9pHGU6BiVy23UfMg+Qobd4ii3rN8EZXh2A1KkHLcUjfqfGaT856Vqt8A/DbAS1dxGRXdGtpbDAOqM8y5U6E6ALPM0cwfDXYLexbm7cX3AwXKnOAqgAtPM7RptXHZy0Rcd0/wDqJIggEPBlND+nf50ZxOJdtNAo22C+YAp0LoRy1jxFq5i2V+QSQdAJIMEgxqaDY3GC3cUZFZbikQ0x/psGUkDf3jV/DWSzATvuT9aBdrEZLlkx3VzrPLM2Uj1AP1rq8A4+67F3jlxzfLoMr8hbGXQDYKnKBr85p44U/tEQj4wsf7oj71Dj8Olm6+KQLNhCrITH+owVEI8GDuD4jxqzwW0iGFIKAF7Uc0cFkAjpmy/7a6Ol2by430WGQq0bjcHqORrdxwBqYFUeJcbS0ktbYx7uRXgA7hnOg9flQPhXEXvm87mBAVVGyzyHU670aYpy80uWL7BwRsGBnwBr0pLRGpMDkf4rzVEr0PBXM6IY+EE6zrAmus6fAh7RmXLM0n9rMK4OcSQNGG8eNMeJxeXuIdeZ6eXjVQICCDrO/jWfLaMdJPoR+HcRCuM2gmne0/e30I/ppZ432MYDPacQ3wNy8iKYcEpCJmAzBQD5ga60r5xjXWpIqceXRD5iqmAuAoRzB+9W+0STa05MP2oFwlsrkE+8PqNvzTP0YnjDQ3H6o0H5qRAAJPej9Wir4xzqMXAhB0mCdeg5Uq4+3icWxXMLdsnS2k7f5N08KxLTXSRZ7Q8fJUph8zudC6+6uuoB9dqo8E4PcjM5idSTBk/OjvBOA5FCxmYcuQpjtYNU1fU9OQrcQP1T6QK4Rw90OYwBvmjU+QoticaFGh168zVbF43eKFu5bwHX9hQt4HMftnWJxRPUnkB+elVof9YHh0rpmVR0+586HXOO2gSM21Kdj1LYpoOdTrETUSVIHG1cG09OHvgVUN7epXtia0irO1cjGmdYNjuatvcqK0hdlRBJYgAdSdAKcuFdi9mvt/sQ/wDk/wC3rWqXTOq5hdsUMLg7l18qKzHoon16Dzp14N2MIhr7/wCxD/5P+3rTbw/B20XIiqgGwEAE+J5nzq8z7ggajRRBg9dNqaoS9Jb56rzoqYXDpbXKiBR4D7nnU7aiK5ZCpg1k0Yjf6COJpNph019NPzSuGIMjl+KdMQmYMOoI+cUk3Wgmtn+BV/QxibCXB30Vp11EwT06ULXszYZpykDcjMwWOp5x86KYO6HQHpofMVOhiQdiIrHKDVNeMiXCplyodFGgy5RA6a1Nh4VUMxvIUasZ5nyrSKFnUEnTSYA5kk1ImeIQhVGpY7j58iegk12GHAQIzz8IO2m+keB1oZx+wLuGZVWGWGST+kzqT8x86v5BOgLnr+evrUj2jl7xAHy005xpXM5PHokcYdbrM7knMZNu2Tl8AWO/pUnCMeqJclFS2gBbISX10AbWSTyk0v4viiAZAwHUJy8J/BNDVusQVWcrEFh1Kzl9JNKTwoqfob8BxTOD7I3FKqS2fJlYFo9wTG4kTB10rMNaW1nCjR2DqBoBmRZXwAM/KKrcD4i1sDNba5AgZdDHRhGtH+HcNfEsXdMgJ2206AVn1X6Mcyvy8CHDsNbDDMyMVWXCy/eJEDpp6k+VMuDdyNso5DnHj0rOFcIS2uVF8zzPiTRXIiCW1PSmJP2hFdvJ8KYwGfwHX+7124RBAGY9TUON4j4wKFvipknQDmdordZsykX1v52A3nSquLvKjQwJXkwEj51BwnF27ksjhspIPn+R40XZFfTLJ8eX71mGU1vQB4piLT2zDrK6gTr5QaWBcYMCnLn+1N+K7Mo0lD48o8preA4EqanvH6VoLbA2DwrPBdXg8zr6DlR3C8NPIZEHqfOi+VUHe9KHYzHk7eg2rtwJTvpLcvIiwunjzoPicUWOk67Ab1j3CxMHTry+XWorjBR9zzNBujkkvCJkHxanpyHn1qjjseqLmY/3wofxbjipKrq3286F4TAPebPcJjp/FJ5LSHxBj4m9iWypKpzPWi9rs9bAE6nnRDAYUKNBAq/mFSVyN+FCnDzQtWLWVlVoB+mKs10QAKysrl6dXhJbfmNxtXonZPj3t0yOf9VB/wA1/UPEc/WsrKbx+k/PKc9jGKtYZwN9AOg1Y+NZWU4gR04nU6A821Y+QqFgRWqysCYPtsRcdSd8rr5EZW/8R60lcZtst51nSSR5HUfQ1usrp/I5/iS8Ev5Hycn+4Bj9qPtWVlFXps+EaJJPhVfH8XsWBN9woM5V1LNESVQanf61lZQs1CrxT/5EOq4a1H+dz8Ip+5+VKHEuLYnEH/Wuu4/Tsg8kWBWVlYNUoiwvDLjmERmO8BSTHlTh2Z7HX2bO9vKFgqHiDPhOkRzrKytQFUz0rh3Arad5lGYgAxG3TSi9rBqusZR9f4rKyuZkrfTL2LCiF0oNiMeWIAkydfLT+/KsrKwNAXiXFEtCHOd9YRdTr16eZoPZwuJxjD2kok6IJ1//AF9qysokLpsbsBg0w3dC7eI1PiatYa6G2Ox18D0rKyh/Z3yvkIoSd9vpUV/FKu3rWVlczZBGJxZNVchPven7/tW6yhGkOMxSW1JYgRSpdx9/EsUsIxHMjT68qyspHNTmXg7ilM6wvZ5rbTdU5vHb150atoNhWVleerdela8LaLAqLMaysrjj/9k=" style="width:100%">
  <div class="text"><mark style="background-color: rgba(0, 0, 0,0.7); color: white;">Becoming</mark></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">6 / 6</div>
  <img src="https://s26162.pcdn.co/wp-content/uploads/2020/06/Brit-Bennett.jpg" style="width:100%">
  <div class="text"><mark style="background-color: rgba(0, 0, 0,0.7); color: white;">The Vanishing Half</mark></div>
</div>

<button class="prev" onclick="prevSlide()"><</button>
<button class="next" onclick="showSlides()">></button>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 

</div>

<script>
var timeOut = 2000;
var slideIndex = 0;
var autoOn = true;

autoSlides();

function autoSlides() {
    timeOut = timeOut - 20;

    if (autoOn == true && timeOut < 0) {
        showSlides();
    }
    setTimeout(autoSlides, 20);
}

function prevSlide() {

    timeOut = 2000;

    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slideIndex--;

    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    if (slideIndex == 0) {
        slideIndex = 6
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
}

function showSlides() {

    timeOut = 2000;

    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slideIndex++;

    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
}
</script>

</body>
</html>
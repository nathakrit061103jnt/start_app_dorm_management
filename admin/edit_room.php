<?php
session_start();
if (isset($_SESSION["aid"])) {
    if (isset($_GET["room_id"])) {
        $room_id = $_GET["room_id"];
        ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>เเก้ไขข้อมูลห้องพัก</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <?php include_once "./sidebar.php";?>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <?php include_once "./navbar.php";?>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <!-- <h1 class="h3 mb-2 text-gray-800">ห้อง </h1> -->
                    <!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">ฟอร์มเเก้ไขข้อมูลห้องพัก</h6>
                        </div>
                        <div class="card-body">
                            <?php
include_once "./configs/connectDB.php";

        $sql_r = "SELECT * FROM `room` WHERE room_id='$room_id';";
        $result_r = mysqli_query($conn, $sql_r);

        while ($data_r = mysqli_fetch_assoc($result_r)) {
            ?>
                            <form action="" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputAddress">หมายเลขห้อง</label>
                                        <input type="text" readonly required name="room_id"
                                            value="<?=$data_r["room_id"]?>" class="form-control"
                                            placeholder="หมายเลขห้องห้ามซ้ำกัน เช่น a53 b59">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">มิเตอร์น้ำตั้งต้น</label>
                                        <input type="number" min="0" value="<?=$data_r["meters_water"]?>"
                                            name="meters_water" required class="form-control">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">มิเตอร์ไฟตั้งต้น</label>
                                        <input type="number" min="0" value="<?=$data_r["meters_light"]?>"
                                            name="meters_light" required class="form-control">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <div class="form-group">
                                            <label for="inputAddress">ประเภทห้องพัก</label>
                                            <select class="form-control" name="room_tid">
                                                <?php

            $sql = "SELECT * FROM roomtype";
            $result = mysqli_query($conn, $sql);

            while ($data = mysqli_fetch_assoc($result)) {?>
                                                <option value="<?=$data["room_tid"]?>" <?php
if ($data_r["room_tid"] == $data["room_tid"]) {
                echo "selected";
            }
                ?>><?=$data["room_tname"]?></option>
                                                <?php
}

            ?>
                                            </select>
                                        </div>
                                    </div>

                                    <button type="submit" name="updateRoomSubmit"
                                        class="btn btn-warning text-dark">เเก้ไข
                                    </button>
                            </form>
                            <?php
}

        ?>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <?php
include_once "./configs/connectDB.php";
        if (isset($_POST["updateRoomSubmit"])) {
            $room_id = $_POST["room_id"];
            $sql_up = "UPDATE `room` SET `meters_water` = '" . $_POST["meters_water"] . "' ,
                        `meters_light` = '" . $_POST["meters_light"] . "',
                        `room_tid` = '" . $_POST["room_tid"] . "'
                       WHERE `room`.`room_id` = '$room_id';";

            if (mysqli_query($conn, $sql_up)) {
                echo "<script>";
                echo "alert('เเก้ไขข้อมูลเรียบร้อย');";
                echo "</script>";

                echo "<script>";
                echo "location = './data_room.php';";
                echo "</script>";

            } else {
                echo "<script>";
                echo "alert('ไม่สามารถเเก้ไขข้อมูลได้');";
                echo "</script>";
            }

        }

        ?>

            <!-- Footer -->
            <?php
include_once "./footer.php";
        ?>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>
<?php
}
} else {
    echo "<script>";
    echo "location = './login.php';";
    echo "</script>";

}
?>
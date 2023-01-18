

<?php
 $id = $_GET['id'];
 $sql1 = $koneksi->query("select * from jenis_barang where id = '$id'");
 $tampil = $sql1->fetch_assoc();
 
 $level = $tampil['level'];

 
 
 
 ?>
 
  <div class="container-fluid">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"> Ubah Barang</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
							
							
							<div class="body">

							<form method="POST" enctype="multipart/form-data">
							
							<label for="">Id Barang</label>
                            <div class="form-group">
                               <div class="form-line">
                                  <input type="text" name="id_barang" class="form-control" id="id_barang" value="<?php echo $tampil['id']; ?>" readonly />	 
							</div>
                            </div>
							
								
							<label for="">Jenis Barang</label>
                            <div class="form-group">
                               <div class="form-line">
                                <input type="text" name="jenis_barang" value="<?php echo $tampil['jenis_barang']; ?>" class="form-control" /> 	 
							</div>
                            </div>
							
							
							<input type="submit" name="simpan" value="simpan" class="btn btn-primary">
							
							</form>
							
							
							
							<?php
							
								if (isset($_POST['simpan'])) {
		
								$jenis_barang= $_POST['jenis_barang'];
								

								$sql = $koneksi->query("update jenis_barang set jenis_barang='$jenis_barang' where id='$id'"); 
								
								if ($sql1) {
									?>
									
										<script type="text/javascript">
										alert("Data Berhasil Diubah");
										window.location.href="?page=jenisbarang";
										</script>
										
										<?php
								}
							}
							?>
										
										
										
										
								
								
								
								
								

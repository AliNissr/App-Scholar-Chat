
class MassagesModal{
  String massage;
  String  id;
  MassagesModal(this.massage , this.id);

  factory MassagesModal.jsondata (datamassage){
    return MassagesModal(datamassage['fullname'] , datamassage['id'] );
  }
}
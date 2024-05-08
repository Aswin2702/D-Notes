import Text "mo:base/Text";
import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {

  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNotes(title: Text, contentText: Text) {
    
    let newNote = {
      title = title;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show (notes));
  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(id: Nat) {
    let listFront: List.List<Note> = List.take(notes, id);
    let listBack: List.List<Note> = List.drop(notes, id + 1);

    notes := List.append(listFront, listBack);
  };
}

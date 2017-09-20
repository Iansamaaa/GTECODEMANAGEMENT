  var chars = "abcdefghijklmnopqrstuvwxyz1234567890";
    var passgen = "";
    for (var x = 0; x <=5; x++) {
        var i = Math.floor(Math.random() * chars.length);
        passgen += chars.charAt(i);
    }

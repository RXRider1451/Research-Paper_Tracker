  //Note, fields are delimited using ~
  //Assigning class to variable to remove re-declaration issue
  var ResearchPaperItem = class ResearchPaperItem {
      constructor(id, paper_name) {
          this.id = id;
          this.paper_name = paper_name;
          this.link = "";
          this.authors = [];
          this.style = "";
          this.cross_references = [];
          this.purpose = "";
          this.dataset = "";
          this.method = "";
          this.results = "";
      }

      //Getters and Setters

      setPurpose(purpose){
        this.purpose = purpose;
      }

      getPurpose(){
        return this.purpose;
      }

      setDataset(dataset){
        this.dataset = dataset;
      }

      getDataset(){
        return this.dataset;
      }

      setMethod(method){
        this.method = method;
      }

      getMethod(){
        return this.method;
      }

      setResults(results){
        this.results = results;
      }

      getResults(){
        return this.results;
      }

      setId(id) {
          this.id = id;
      }

      setPaperName(paper_name) {
          this.paper_name = paper_name;
      }

      setLink(link) {
          this.link = link;
      }

      addAuthor(author) {
          this.authors.push(author);
      }

      addCrossRef(crossRef) {
          this.cross_references.push(crossRef);
      }

      setStyle(style) {
          this.style = style;
      }

      setSummary(summary) {
          this.summary = summary;
      }

      getId() {
          return this.id;
      }

      getPaperName() {
          return this.paper_name;
      }

      getLink() {
          return this.link;
      }

      getStyle() {
          return this.style;
      }

      returnAuthorString() {
          var authorString = "";
          for (var i = 0; i < this.authors.length; i++) {
              authorString += this.authors[i];
              if (i + 1 < this.authors.length) {
                  console.log("There's another author");
                  authorString += ", "
              }
          }
          return authorString;
      }

      returnCrossRefString() {
          var refString = "";
          for (var i = 0; i < this.cross_references.length; i++) {
              refString += this.cross_references[i];
              if (i + 1 < this.cross_references.length) {
                  refString += "~"
              }
          }
      }

      getSummary() {
          return this.summary;
      }

      returnFirstAuthor() {
          return this.authors[0];
      }

      populateAuthorArray(authorString) {
          this.authors = authorString.split('~');
          console.log("Author Array");
          console.log(this.authors);
      }


      returnListItem() {
          var listItem = document.createElement('div');
          listItem.setAttribute('class', 'listItem mycard');
          listItem.setAttribute('data-id', this.id);

          var infoDiv = document.createElement('div');
          infoDiv.setAttribute('class', 'info');

          var paperName = document.createElement('p');
          paperName.setAttribute('class', 'paperName width-fit-content');
          paperName.innerHTML = this.paper_name;
          infoDiv.appendChild(paperName);

          if(this.style != ""){
            var style_or_type = document.createElement('p');
            style_or_type.innerHTML = this.style;
            style_or_type.setAttribute('class','width-fit-content');
            infoDiv.appendChild(style_or_type);
          }

          if(this.authors.length != 0){
            var author = document.createElement('p');
            author.setAttribute('class', 'author width-fit-content');
            author.innerHTML = this.returnFirstAuthor();
            infoDiv.appendChild(author);
          }

          if(this.link != ""){
            var link = document.createElement('a');
            link.setAttribute('href',this.link);
            link.setAttribute('class','width-fit-content')
            link.innerHTML = "Link to the paper";
            infoDiv.appendChild(link);
          }



          var that = this;
          var btnGroup = document.createElement('div');
          btnGroup.setAttribute('class', 'button-control-group');

          var btnEdit = document.createElement('button');
          btnEdit.setAttribute('class', 'button-control btn btn-success');
          btnEdit.innerHTML = "Edit";
          btnEdit.setAttribute('action', 'PUT');
          btnEdit.onclick = function(ev) {
              location.href = 'research_papers/' + that.id + '/edit';
          }

          var form = document.createElement('form');
          form.setAttribute('method', 'post');
          form.setAttribute('action', 'research_papers/' + that.id);

          var input = document.createElement('input');
          input.setAttribute('type', 'hidden');
          input.setAttribute('name', '_method');
          input.setAttribute('value', 'delete');
          input.setAttribute('autocomplete', 'off');



          var btnDelete = document.createElement('button');
          btnDelete.innerHTML = "Delete";
          btnDelete.setAttribute('type', 'submit');
          btnDelete.setAttribute('class', 'button-control btn btn-danger');
          btnDelete.onclick = function(ev) {

              var confirm = window.confirm("Are you sure you want to remove this paper?");
              if(confirm){
                console.log(currentPriorityList);
                console.log(that.id);
                removeFromPriorityList(currentPriorityList, that.id);
                console.log(currentPriorityList);
                console.log("Got here");
                var priorityString = createPriorityListString(currentPriorityList);
                console.log("After Update: " + priorityString);
                updatePriorityList(priorityString); // THIS IS NOT WORKING
                form.submit();
              }

          }

          var btnShow = document.createElement('button');
          btnShow.setAttribute('class', 'button-control btn btn-primary');
          btnShow.innerHTML = "Show";
          btnShow.setAttribute('action', 'GET');
          btnShow.onclick = function(ev) {
              location.href = 'research_papers/' + that.id;
          }

          form.appendChild(input);
          form.appendChild(btnDelete);

          listItem.appendChild(form);
          listItem.appendChild(infoDiv);


          btnGroup.appendChild(btnEdit);
          btnGroup.appendChild(btnDelete);
          btnGroup.appendChild(btnShow);

          var container = document.createElement('div');
          container.setAttribute('class', 'container');
          container.appendChild(btnGroup);

          listItem.appendChild(btnGroup);

          return listItem;
      }


  }

  function createPriorityListString(prioritisedList) {
      var priorityListString = "";
      for (var i = 0; i < prioritisedList.length; i++) {
          priorityListString += prioritisedList[i];
          if (i + 1 < prioritisedList.length) {
              priorityListString += "~";
          }
      }

      return priorityListString;
  }


  function removeFromPriorityList(currentPriorityList, id) {
      for (var i = 0; i < currentPriorityList.length; i++) {
          if (currentPriorityList[i] == id) {
              currentPriorityList.splice(i, 1);
              return;
          }
      }
  }

  function addToPriorityList(id) {
      currentPriorityList.push(id);
  }

  function updatePriorityList(priorityListString) {
      console.log("Updating Priority List with this string: ");
      console.log(priorityListString);
      $.ajax({
          url: "/research_papers_update_priority",
          type: "post",
          data: {
              priorityList: priorityListString,
          },
          success: function() {
              //alert('Updated Successfully');
              console.log("Updated Priority Successfully");
              //window.location.reload();
          },
          error: function() {
              alert('Error');
          }
      });
  }



  function displayPrioritisedList(currentPriorityList) {
      var list = document.getElementById('sortableList');

      for (var i = 0; i < currentPriorityList.length; i++) {
          var currPriority = currentPriorityList[i];
          for (var j = 0; j < allResearchPapers.length; j++) {
              if (allResearchPapers[j].getId() == currPriority) {
                  list.appendChild(allResearchPapers[j].returnListItem());
                  break;
              }
          }
      }
  }

<html>
  <head>
    <title>Simple JQuery Datepicker example</title>
    <g:javascript library="jquery" />
   
	<!-- Manually include jquery-ui resources -->
	<link href="${createLinkTo(dir:'js/jquery.ui/css/cupertino', file:'jquery-ui-1.8.2.custom.css')}" type="text/css" rel="stylesheet" media="screen, projection" />
	<script src="${createLinkTo(dir:'js/jquery.ui/js/', file:'jquery-ui-1.8.2.custom.min.js')}" type="text/javascript" ></script>	
	
</head> 
<body>
	
	<div>
		<img id="person-icon" src="../images/icons/search.png"   style="vertical-align: middle;"/>
		<input id="person-suggest" type="text" name="person-suggest" style="width: 300px;"> 		
		<input id="person-id" type="hidden" name="person-id"/>
		<span id="person-name"></span>		
	</div>		
	<script>
		$(document).ready(function() {
			$('#person-suggest').focus();
			$("#person-name").click(function() {
				$('#person-suggest').val("");
				$('#person-name').hide();
				$('#person-suggest').show();				
				$('#person-suggest').focus();
				$('#person-suggest').select();
			});
	      	$("#person-suggest").autocomplete({
	            width: 400,
	            minLength: 2,
	            dataType: 'json',
	            highlight: true,
	            selectFirst: true,
	            scroll: true,
	            autoFill: true,
	            //scrollHeight: 300,
				//define callback to format results
				source: function(req, add){
					//pass request to server
					$.getJSON("searchByName", req, function(data) {
						var people = [];
						$.each(data, function(i, item){
							people.push(item);
						});
						add(people);
					});
		      	},
		        focus: function(event, ui) {			        
		      		$('#person-suggest').val(ui.item.label);					
		      		return false;
		        },	
				select: function(event, ui) {	
					search_option = ui.item;		
					$('#person-suggest').val(ui.item.label);
					$('#person-name').html(ui.item.label);
					$('#person-id').val(ui.item.value);
					$('#person-icon').attr('src', '../images/icons/silk/user.png');
					$('#person-suggest').hide();
					$('#person-name').show();
					return false;
				}
			});
		});
	</script>		
		
		
	
	
</body> 
</html>
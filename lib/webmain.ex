defmodule WebMain do
	use Ewebmachine
	resource [] do
		to_html do: "<html><body>Hello world</body>"
	end
end
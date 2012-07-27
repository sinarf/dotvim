#!groovy

/**
 *  Copy the rc file to home.
 *
 * @author Michel Blavin 
 */

// TODO do the symbolic links for linux. 

def ENV = System.getenv()
def HOME = ENV['HOME']

boolean accept = false // the user hasn't accepted the overide yet. 

if (!HOME) throw new IllegalStateException ("HOME variable not set. Please, do.")

System.in.withReader {
	print 'Would you overwrite the .vimrc and .gvimrc in your HOME directory. : '
	String response = it.readLine().toUpperCase()
	accept = response &&  response.startsWith("Y")

}

if (accept) {
	println 'Copie files'
	def vimrc = new File("$HOME/.vimrc")
	vimrc.writable = true
	vimrc.write ''
	vimrc << new File(".vimrc").asWritable()
	vimrc.writable = false

	def gvimrc = new File("$HOME/.gvimrc") 
	gvimrc.writable = true
	gvimrc.write ''
	gvimrc << new File(".gvimrc").asWritable()
	gvimrc.writable = false
	println 'done'
} else {
	println 'Nothing has been done!'
}

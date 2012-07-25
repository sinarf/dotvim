!groovy

/**
 *  Copy the rc file to home.
 *
 * @author Michel Blavin 
 */
def ENV = System.getenv()
def HOME = ENV['HOME']
if (!HOME) throw new IllegalStateException ("HOME variable not set. Please, do.")


println 'Copie files'
new File("$HOME/.vimrc") << new File(".vimrc").asWritable()
new File("$HOME/.gvimrc") << new File(".gvimrc").asWritable()

println 'done'

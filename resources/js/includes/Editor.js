import EditorJS from '@editorjs/editorjs';
import ImageTool from '@editorjs/image';
import InlineCode from '@editorjs/inline-code';
import Table from '@editorjs/table';
import List from '@editorjs/list';
import Checklist from '@editorjs/checklist';
import CodeTool from '@editorjs/code';
import Paragraph from '@editorjs/paragraph';

let editorJs = document.getElementById('editorjs');

if (editorJs) {
    let postBodyTextArea = document.getElementById('post-body-text-area'),
      imgSaveEndpoint = editorJs.dataset.imgSaveEndpoint,
      postId = editorJs.dataset.postId,
      csrfMeta = document.querySelector("meta[name='csrf-token']").getAttribute("content"),
      ticketContent = "";

      console.dir(postBodyTextArea);
    try {
      ticketContent = JSON.parse(postBodyTextArea.innerText);
    } catch (e) {
      ticketContent = {
        blocks: [
          {
            type: "paragraph",
            data: {
              text: postBodyTextArea.innerText,
            }
          },
        ]
      }    
    }
    
    const config = {
      /**
       * Id of Element that should contain Editor instance
       */
      holder: 'editorjs',
      placeholder: 'Begin by adding content...',
      /**
       * Previously saved data that should be rendered here
       * //Get saved data https://editorjs.io/fill-block-with-saved-data
       */
      data: {
        // Grab the saved data from the text area and include it here
          ...ticketContent
      },
      /**
       * onReady callback
       */
      // onReady: () => {
      //     // console.log('Editor.js is ready to work!')
      // },
  };

  if(imgSaveEndpoint && postId){
    config.tools = {
        //options: https://github.com/editor-js/image
        image: {
            class: ImageTool,
            config: {
                endpoints: {
                    byFile: imgSaveEndpoint, // Your backend file uploader endpoint
                },
                field: 'uploadFile',
                additionalRequestData: {
                    // ToDo: reinstate these below
                     'post_id': postId,
                     '_token': csrfMeta,
                },
            }
        },
        //options: https://github.com/editor-js/inline-code
        inlineCode: {
            class: InlineCode,
            shortcut: 'CMD+SHIFT+M',
        },
            // Options: https://github.com/editor-js/paragraph
        paragraph: {
          class: Paragraph,
          inlineToolbar: true,
          text: {
            type: "string",
            allowedTags: "p,i,b,u,a[href],strong,em,br,dd,dt,dl,embed,div"
          }
        },
        //options: https://github.com/editor-js/table
        table: {
            class: Table,
        },
        //options: https://github.com/editor-js/list
        list: {
            class: List,
            inlineToolbar: true,
        },

        //options: https://github.com/editor-js/checklist
        checklist: {
            class: Checklist,
            inlineToolbar: true,
        },

        //options: https://github.com/editor-js/code
        code: CodeTool,
    };

    /**
     * onChange callback
     */
    config.onChange = ()=>{
        editor.save()
        .then((outputData) => {
            let postBodyTextAreaReset = document.getElementById('post-body-text-area');
            postBodyTextAreaReset.innerHTML = "";
            postBodyTextAreaReset.innerHTML = JSON.stringify(outputData).replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;");
         }).catch((error) => {
            console.log('Saving failed: ', error)
        });
    };

    const editor = new EditorJS(config);
  }
}
